pkgname=sound_themer
pkgver=0.3.0
pkgrel=1
pkgdesc="A program to play sounds from a selected sound theme."
arch=('x86_64')
url="https://github.com/tmforshaw/sound_themer"
license=('MIT')
depends=('wireplumber' 'sound-theme-freedesktop')
makedepends=('cargo' 'git')
install=sound_themer.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('15187f21331ce7a87a27d7570f8280ef2eba2a597848c8d9022bc70e89ba1c59')

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
