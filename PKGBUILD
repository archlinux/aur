pkgname=sound_themer
pkgver=0.1.0
pkgrel=3
pkgdesc="A program to play sounds from a selected sound theme."
arch=('x86_64')
url="https://github.com/tmforshaw/sound_themer"
license=('MIT')
depends=('wireplumber')
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bed43396bb985d6f1fd1b50bcab81c9383524214f6c9668cb3b29a8c3acf2c93')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked
}

package() {
	cd "$pkgname-$pkgver"

	# Install the binary
	install -Dm755 target/release/sound_themer"$pkgdir/usr/bin/sound_themer"

	# Install the default config file
    install -d "$pkgdir/etc/sound_themer"
    install -Dm644 default/config.toml "$pkgdir/etc/sound_themer/config.toml"
}

post_install() {
	/usr/bin/sound_themer -t freedesktop -e oga play complete
	echo -e "If you didn't just hear a completion sound, the installation is broken"
}
