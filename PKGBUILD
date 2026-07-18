pkgname='gaypanel'
pkgver=1.0.0
pkgrel=2
pkgdesc='Panel for Wayland compositors'
arch=(any)
url='https://codeberg.org/pastthepixels/gaypanel'
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
license=('GPL-3.0-only')
makedepends=(
	# For building
	'rust'
	'clang'
	'git'
)
depends=(
	# Networks/bluetooth
	'networkmanager'
	'bluez'
	# Sound
	'alsa-lib'
	# GTK
	'gtk4-layer-shell'
	'blueprint-compiler'
	'libadwaita'
	'adwaita-icon-theme'
	# Wayland
	'libxkbcommon'
)
optdepends=(
	'power-profiles-daemon: ppd widget'
)
sha256sums=('3298eae94a5df6bb29f4134e1081ffddf289c98c1c6f912ed33ecedcbd73c117')

build() {
	cd gaypanel
	
	cargo build --release --no-default-features
}

package() {
	install -Dm 0755 gaypanel/target/release/gaypanel $pkgdir/usr/bin/gaypanel
}

