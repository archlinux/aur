pkgname=bar_daemon
pkgver=0.3.0
pkgrel=1
pkgdesc="Async status bar daemon for Linux. Uses event-driven updating of values"
arch=('x86_64')
url="https://github.com/tmforshaw/bar_daemon"
license=('MIT')
depends=('wireplumber' 'brightnessctl' 'bluez' 'bluez-utils' 'acpi' 'asusctl' 'procps-ng')
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f964ee8eb332a588a7fb09b44dffd877cfc98e724aeb38be2d23e2275561b337')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm755 target/release/bar_daemon "$pkgdir/usr/bin/bar_daemon"
}
