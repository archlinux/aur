pkgname=bar_daemon
pkgver=0.4.2
pkgrel=1
pkgdesc="Async status bar daemon for Linux. Uses event-driven updating of values"
arch=('x86_64')
url="https://github.com/tmforshaw/bar_daemon"
license=('MIT')
depends=('wireplumber' 'brightnessctl' 'bluez' 'bluez-utils' 'acpi' 'asusctl' 'procps-ng')
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8334dbef7c4c2a848a0500feb910cb8dc8e5d0de5cbc9639b4541d033828edb2')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 target/release/bar_daemon "$pkgdir/usr/bin/bar_daemon"

	cd "$srcdir/$pkgname"
    install -Dm644 default/config.toml "$pkgdir/etc/bar_daemon/config.toml"
}
