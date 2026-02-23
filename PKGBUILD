pkgname=sound_themer
pkgver=0.3.3
pkgrel=1
pkgdesc="A program to play sounds from a selected sound theme."
arch=('x86_64')
url="https://github.com/tmforshaw/sound_themer"
license=('MIT')
depends=('wireplumber' 'sound-theme-freedesktop')
makedepends=('cargo' 'git')
install=sound_themer.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8066f8b18f5b3925901ee6898537ece596d5c2814c77a2a16be44fb053057123')

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
