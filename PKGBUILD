# Maintainer: William Turner <willtur.will@gmail.com> 
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=afdko-git
pkgver=2.7.3a4.r0.ec914b7
pkgrel=1
pkgdesc='Tools used by Adobe font developers for wrapping up PostScript fonts as OpenType/CFF font files'
arch=('x86_64')
url="https://github.com/adobe-type-tools/${pkgname%-git}"
license=('custom')
depends=('python2'
         'python2-booleanoperations'
         'python2-defcon'
         'python2-fontmath'
         'python2-fonttools'
         'python2-mutatormath'
         'python2-robofab'
         'python2-wheel'
         'python2-ufonormalizer-git')
depends_x86_64=('lib32-glibc')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/adobe-type-tools/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
    cd "${pkgname%-git}"
    python2 setup.py -q build
}

package() {
    cd "${pkgname%-git}"
    python2 setup.py -q install --root="$pkgdir" --optimize=1
    install -D -m644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
