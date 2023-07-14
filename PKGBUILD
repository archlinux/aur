# Maintainer: Aaron Honeycutt <aaron at system76 dot com>
pkgname=system76-keyboard-configurator
pkgver=1.3.8
pkgrel=1
pkgdesc="Configures keymap and backlight of System76 keyboards."
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/keyboard-configurator"
license=('GPL3')
depends=('gtk3' 'hidapi' 'xz')
makedepends=('cargo' 'systemd')
source=("keyboard-configurator-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('680aaeb62c06baca14025788b8fea2e64011ed5b26a19b410ee57d785bcafb69')

prepare() {
	cd "keyboard-configurator-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	make vendor
}

build() {
	cd "keyboard-configurator-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	make VENDOR=1 prefix=/usr
}

package() {
	cd "keyboard-configurator-$pkgver"
	make prefix=/usr DESTDIR="$pkgdir/" install
}
