pkgname='gaypanel-git'
pkgver=1.0.0
pkgrel=2
pkgdesc='Panel for Wayland compositors - latest build from source'
arch=(any)
url='https://codeberg.org/pastthepixels/gaypanel'
source=("git+$url.git")
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
	'xkbcommon'
)
optdepends=(
	'power-profiles-daemon: ppd widget'
)
sha256sums=('SKIP')

pkgver() {
	sed -nr 's/^version \= "(.*)"/\1/p' gaypanel/Cargo.toml
}

build() {
	cd gaypanel
	
	cargo build --release --no-default-features
}

package() {
	install -Dm 0755 gaypanel/target/release/gaypanel $pkgdir/usr/bin/gaypanel
}

