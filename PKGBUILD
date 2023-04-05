pkgname=trick-or-treat
pkgver=1.3
pkgrel=1
pkgdesc="WebSocket-based virtual private network"
url="https://github.com/lanthora/trick-or-treat"
license=('MIT')
arch=('x86_64' 'aarch64' 'armv7h')
source=("https://github.com/lanthora/trick-or-treat/archive/refs/tags/v$pkgver.tar.gz" )
sha256sums=('1531ab793ec584dfe16e821cc28b82628f196212b5d8c76c5bba809f881144e1')
makedepends=('cmake' 'make' 'pkgconf')
depends=('spdlog' 'openssl' 'libconfig' 'ixwebsocket' 'uriparser')
backup=('etc/candy.conf')

build() {
        cd "$pkgname-$pkgver/build"
        cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
        make
}

package() {
        cd "$pkgname-$pkgver"
        install -D -m 644 candy.conf "$pkgdir/etc/candy.conf"
        install -D -m 644 candy.service "$pkgdir/usr/lib/systemd/system/candy.service"
        cd build
        make DESTDIR="$pkgdir/" install
}
