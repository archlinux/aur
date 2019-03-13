# Maintainer: William Turner <willtur.will@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=afdko
pkgver=2.8.7
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
sha256sums=('795de79f48220cd0f463e82f37c84688e1e5f81f23f79740d121655744eef618')

build() {
    cd "$pkgname-$pkgver"
    python2 setup.py -q build
}

package() {
    cd "$pkgname-$pkgver"
    python2 setup.py -q install --root="$pkgdir" --optimize=1
    install -D -m644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
