pkgname=sound_themer
pkgver=0.3.1
pkgrel=1
pkgdesc="A program to play sounds from a selected sound theme."
arch=('x86_64')
url="https://github.com/tmforshaw/sound_themer"
license=('MIT')
depends=('wireplumber' 'sound-theme-freedesktop')
makedepends=('cargo' 'git')
install=sound_themer.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b41d6e186b21a5a2c170fc068adfed451e1033e823cde119b59e54974fa45eba')

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
