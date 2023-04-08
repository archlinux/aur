pkgname=trick-or-treat
pkgver=1.4
pkgrel=1
pkgdesc="WebSocket-based virtual private network"
url="https://github.com/lanthora/trick-or-treat"
license=('MIT')
arch=('x86_64' 'aarch64' 'armv7h' 'riscv64')
source=("https://github.com/lanthora/trick-or-treat/archive/refs/tags/v$pkgver.tar.gz" )
sha256sums=('a2529e62c219b9dcc7333b572e7f36b57a5aeabd87b8131a7c7006940677c3ee')
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
