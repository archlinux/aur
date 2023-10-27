# Maintainer: Aaron Honeycutt <aaron at system76 dot com>
pkgbase=keyboard-configurator-git
pkgname=system76-keyboard-configurator-git
pkgver=1.3.10
pkgrel=2
pkgdesc="Configures keymap and backlight of System76 keyboards."
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/keyboard-configurator"
license=('GPL3')
depends=('gtk3' 'hidapi' 'xz')
makedepends=('cargo' 'systemd')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

prepare() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
        make vendor
}

build() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	make VENDOR=1 prefix=/usr
}

package() {
	cd "$pkgname"
	make prefix=/usr DESTDIR="$pkgdir/" install
}
