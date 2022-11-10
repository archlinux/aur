# Maintainer: Stein Gunnar Bakkeby <bakkeby@gmail.com>
pkgname="xban"
pkgver="1.0"
pkgrel=1
pkgdesc="Hides the X mouse cursor on keypress and reveals it again when the mouse cursor moves"
url="https://github.com/bakkeby/xban"
arch=("any")
license=('MIT')
depends=('libxi' 'libxfixes')
makedepends=('make')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bakkeby/xban/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('83a3a66c9225ffa802c99959417b456bb34367b6ac7efaffee474bddb1549ef5')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    #make PREFIX=/usr DESTDIR="$pkgdir" install
    install -Dm755 xban "$pkgdir/usr/bin/xban"
    install -Dm644 xban.1 "$pkgdir/usr/share/man/man1/xban.1"
    sed -i "s/VERSION/1.0/g" "$pkgdir/usr/share/man/man1/xban.1"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
