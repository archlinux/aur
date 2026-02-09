pkgname=bar_daemon
pkgver=0.4.3
pkgrel=1
pkgdesc="Async status bar daemon for Linux. Uses event-driven updating of values"
arch=('x86_64')
url="https://github.com/tmforshaw/bar_daemon"
license=('MIT')
depends=('wireplumber' 'brightnessctl' 'bluez' 'bluez-utils' 'acpi' 'asusctl' 'procps-ng')
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('96b250f58c713ea26deb3e385ce7dc34110ed31672dc637bfccb3b7fc6ad095b')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm755 target/release/bar_daemon "$pkgdir/usr/bin/bar_daemon"
    install -Dm644 default/config.toml "$pkgdir/etc/bar_daemon/config.toml"
}
