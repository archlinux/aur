# Maintainer: Aaron Honeycutt <aaron at system76 dot com>
pkgname=system76-keyboard-configurator
pkgver=1.3.0
pkgrel=1
pkgdesc="Configures keymap and backlight of System76 keyboards."
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/keyboard-configurator"
license=('GPL3')
depends=('gtk3' 'hidapi' 'xz')
makedepends=('cargo' 'systemd')
source=("keyboard-configurator-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9c307833040b5232b251eced22b1340b671689901607aafe79586fa22c00806e')

prepare() {
	cd "keyboard-configurator-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "keyboard-configurator-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	make prefix=/usr
}

package() {
	cd "keyboard-configurator-$pkgver"
	make prefix=/usr DESTDIR="$pkgdir/" install
}
