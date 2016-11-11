# Maintainer: Shane Utt <shaneutt@linux.com>

pkgname=packetsender
pkgver=latest
pkgrel=1
pkgdesc="Award-winning network utility for sending / receiving TCP and UDP packets"
arch=('i686' 'x86_64')
url="http://packetsender.com/"
license=('GPL')
depends=('qt5-base')
makedepends=('git' 'qt5-base')

source=("$pkgname::git+https://github.com/dannagle/PacketSender.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname/src"
    qmake
    make
}

package() {
    cd "$srcdir/$pkgname/src"

    install -Dm 755 PacketSender "$pkgdir/usr/bin/packetsender"
}
