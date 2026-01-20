# Maintainer: Abu <abu@matterize.io>
pkgname=ulog
pkgver=1.1.1
pkgrel=1
pkgdesc="USB serial port logger with automatic session management"
arch=('any')
url="https://github.com/matterizelabs/ulog"
license=('MIT')
depends=('socat' 'moreutils' 'coreutils')
backup=('etc/ulog.conf')
install=ulog.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 src/ulog.sh "$pkgdir/usr/bin/ulog"
    install -Dm755 src/ulog-genconfig "$pkgdir/usr/bin/ulog-genconfig"
    install -Dm755 src/ulog-export "$pkgdir/usr/bin/ulog-export"
    install -Dm644 src/ulog.conf "$pkgdir/etc/ulog.conf"
    install -Dm644 services/ulog-genconfig.path "$pkgdir/usr/lib/systemd/system/ulog-genconfig.path"
    install -Dm644 services/ulog-genconfig.service "$pkgdir/usr/lib/systemd/system/ulog-genconfig.service"
    install -Dm644 services/ulog-rollover.service "$pkgdir/usr/lib/systemd/system/ulog-rollover.service"
    install -Dm644 services/ulog-rollover.timer "$pkgdir/usr/lib/systemd/system/ulog-rollover.timer"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Create config directory
    install -dm750 "$pkgdir/etc/ulog.d"
}
