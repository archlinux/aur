# Maintainer: William Turner <willtur.will@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=afdko
pkgver=2.8.10
pkgrel=1
pkgdesc='Tools used by Adobe font developers for wrapping up PostScript fonts as OpenType/CFF font files'
arch=('x86_64')
url="https://github.com/adobe-type-tools/$pkgname"
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
conflicts=("$pkgname-git")
source=("https://github.com/adobe-type-tools/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('f38281633b1333b05477747452f8bc6499ebd778c5cf1a1f19cdc524f499d808')

build() {
    cd "$pkgname-$pkgver"
    python2 setup.py -q build
}

package() {
    cd "$pkgname-$pkgver"
    python2 setup.py -q install --root="$pkgdir" --optimize=1
    install -D -m644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
