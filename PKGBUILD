# Maintainer: Tyler Cook <tcc@sandpolis.com>
pkgdesc='Sandpolis client'
pkgname=sandpolis-client-git
pkgver=8.0.0
pkgrel=1
url='https://github.com/fossable/sandpolis'
arch=('x86_64')
license=('GNU Affero General Public License v3.0')
makedepends=('cargo' 'pkg-config')
depends=('fuse3' 'alsa-lib' 'wayland')
provides=('sandpolis-client')
conflicts=('sandpolis-client')
source=("git+https://github.com/fossable/sandpolis.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/sandpolis"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --features client-tui --features client-gui
}

package() {
	install -Dm 755 "target/release/sandpolis" -t "${pkgdir}/usr/bin/sandpolis-client"
}

