# Maintainer: Stein Gunnar Bakkeby <bakkeby@gmail.com>
pkgname="xban"
_pkgname=xban
pkgver="1.0"
pkgrel=1
pkgdesc="Hides the X mouse cursor on keypress and reveals it again when the mouse cursor moves"
url="https://github.com/bakkeby/xban"
arch=("any")
license=('MIT')
depends=('libxi' 'libxfixes')
makedepends=('git' 'make')
source=(git+https://github.com/bakkeby/xban.git)
sha256sums=('SKIP')

build() {
    cd "$srcdir/$_pkgname"
    make
}

package() {
    cd "$srcdir/$_pkgname"
    #make PREFIX=/usr DESTDIR="$pkgdir" install
    install -Dm755 xban "$pkgdir/usr/bin/xban"
    install -Dm644 xban.1 "$pkgdir/usr/share/man/man1/xban.1"
    sed -i "s/VERSION/1.0/g" "$pkgdir/usr/share/man/man1/xban.1"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
