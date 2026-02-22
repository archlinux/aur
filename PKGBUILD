pkgname=sound_themer
pkgver=0.3.2
pkgrel=1
pkgdesc="A program to play sounds from a selected sound theme."
arch=('x86_64')
url="https://github.com/tmforshaw/sound_themer"
license=('MIT')
depends=('wireplumber' 'sound-theme-freedesktop')
makedepends=('cargo' 'git')
install=sound_themer.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f36a015a2760b13837b3ed392b43fad9f61e78a08140260b292c711a3fc9196c')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked
}

package() {
	cd "$pkgname-$pkgver"

	# Install the binary
	install -Dm755 target/release/sound_themer "$pkgdir/usr/bin/sound_themer"

	# Install the default config file
    install -d "$pkgdir/etc/sound_themer"
    install -Dm644 default/config.toml "$pkgdir/etc/sound_themer/config.toml"
}
