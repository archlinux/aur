pkgname=trick-or-treat
pkgver=1.2
pkgrel=1
pkgdesc="WebSocket-based virtual private network"
url="https://github.com/lanthora/trick-or-treat"
license=('MIT')
arch=('x86_64' 'aarch64' 'armv7h')
source=("https://github.com/lanthora/trick-or-treat/archive/refs/tags/v$pkgver.tar.gz" )
sha256sums=('c53e1a6041a6c42c176d8aa8f2b76c6efdd33d06d4b24436cdf6b906e0188c26')
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
