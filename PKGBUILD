# Maintainer: Jakob Schöttl <jschoett gmail com>
# Maintainer: phi <phi at qgr dot se>
# Contributor: smlb <smlb at riseup dot net>

pkgname=dockd
pkgver=1.3.1
pkgrel=1
pkgdesc="Lenovo ThinkPad Dock Management Daemon"
arch=('i686' 'x86_64')
url="https://github.com/libthinkpad/dockd"
license=('BSD')
depends=('libthinkpad' 'libxrandr')
makedepends=('cmake')
source=("https://github.com/libthinkpad/dockd/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('17f42773f42d8cf6c97d8617ee6e4bd9')

prepare() {
    mkdir -p "$srcdir/$pkgname-$pkgver/etc"
}

build() {
    cd "$pkgname-$pkgver"
    cmake -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 -d etc "$pkgdir/etc/$pkgname"
    make DESTDIR=$pkgdir install
    chmod +x "$pkgdir/etc/$pkgname/dock.hook"
    chmod +x "$pkgdir/etc/$pkgname/undock.hook"
}
