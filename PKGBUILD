pkgname=candy
pkgver=1.6
pkgrel=1
pkgdesc="A WebSocket and TUN based VPN for Linux"
url="https://github.com/lanthora/candy"
license=('MIT')
arch=('x86_64' 'aarch64' 'armv7h' 'riscv64')
source=("https://github.com/lanthora/candy/archive/refs/tags/v$pkgver.tar.gz" )
sha256sums=('634ad19fc9bc6619857fdae7e3ea7edd3f1a0ffab75381d0b6b1b1e9c00d099a')
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
