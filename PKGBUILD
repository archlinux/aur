# Maintainer: Gergely Polonkai <gergely@polonkai.eu>

pkgname=prestopalette
pkgver=0.1.31
pkgrel=1
pkgdesc="An artist's tool for creating harmonious color palettes"
arch=('i686' 'x86_64')
url="http://www.prestopalette.com/"
license=('MIT')
depends=('qt5-base' 'qt5-multimedia' 'hicolor-icon-theme')
makedepends=(clang pngcrush)
install=$pkgname.install
source=(https://github.com/PrestoPalette/PrestoPalette/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('8422158211e89fe4fd255c98fb3ebcd8')

build() {
    cd "$pkgname-$pkgver"

    qmake-qt5 -config release PrestoPalette.pro
    make
}

check() {
    cd "$pkgname-$pkgver"
    make -k check
}

package() {
    cd "$pkgname-$pkgver"

    install -D -m755 build/release/PrestoPalette "$pkgdir/usr/bin/$pkgname"

    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
