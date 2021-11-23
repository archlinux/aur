# Maintainer: Aaron Honeycutt <aaron at system76 dot com>
pkgname=keyboard-configurator-git
pkgver=1.1.0
pkgrel=3
pkgdesc="Configures keymap and backlight of System76 keyboards."
arch=('x86_64')
url="https://github.com/pop-os/keyboard-configurator"
license=('GPL3')
depends=('gtk3' 'hidapi' 'xz')
makedepends=('cargo' 'systemd')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

prepare() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	make prefix=/usr
}

package() {
	cd "$pkgname"
	make prefix=/usr DESTDIR="$pkgdir/" install
}
