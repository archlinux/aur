# SPDX-License-Identifier: 0BSD
# Maintainer: M Stoeckl <com dоt mstoeckl аt wppkgb>
pkgname=windowtolayer-git
pkgver=0.3.0.r0.g56687aa
pkgrel=1
pkgdesc='Modify existing Wayland clients using xdg-shell to draw as a wallpaper instead'
license=('GPL-3.0-or-later')
makedepends=('git' 'rust' 'cargo' 'python')
url='https://gitlab.freedesktop.org/mstoeckl/windowtolayer'
source=('git+https://gitlab.freedesktop.org/mstoeckl/windowtolayer.git')
sha512sums=('SKIP')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
provides=('windowtolayer')
conflicts=('windowtolayer')

pkgver() {
	cd windowtolayer
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
	cd windowtolayer
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd windowtolayer
	CARGO_INCREMENTAL=0 cargo build --release --locked --offline
}

package() {
	cd windowtolayer
	install -D -m755 "target/release/windowtolayer" "$pkgdir/usr/bin/windowtolayer"
}
