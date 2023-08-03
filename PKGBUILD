# Maintainer: Aaron Honeycutt <aaron at system76 dot com>
pkgname=system76-keyboard-configurator
pkgver=1.3.9
pkgrel=1
pkgdesc="Configures keymap and backlight of System76 keyboards."
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/keyboard-configurator"
license=('GPL3')
depends=('gtk3' 'hidapi' 'xz')
makedepends=('cargo' 'systemd')
source=("keyboard-configurator-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('43473425025d0a4b1123c5a2130e9c94368c0d937e56fe063cd2cad471be2e6c')

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
