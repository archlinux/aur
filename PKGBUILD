# Maintainer: rotkonetworks <hq@rotko.net>
# PGP: 813CE099D6CE512BC29A15D841EE1853489958D6

pkgname=bspwm1
pkgver=1.5.0
pkgrel=1
pkgdesc="tiling window manager based on binary space partitioning"
arch=('x86_64')
url="https://github.com/rotkonetworks/bspwm1"
license=('BSD-2-Clause')
depends=('libxcb' 'xcb-util' 'xcb-util-keysyms' 'xcb-util-wm' 'libxkbcommon')
makedepends=('git')
optdepends=('sxhkd: keybinding daemon')
provides=('bspwm')
conflicts=('bspwm')
# Pinned to the release tag. On #branch=master the package built an
# arbitrary master snapshot (pkgver() resolved to e.g. 1.3.1.2.gb707a5e)
# while advertising a fixed version, which is only correct for a -git
# package. Bump this tag with pkgver on each release.
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

pkgver() {
	cd "bspwm1"
	git describe --tags | sed 's/^v//;s/-/./g'
}

build() {
	cd "bspwm1"
	make
}

package() {
	cd "bspwm1"
	make DESTDIR="$pkgdir" PREFIX=/usr install
}
