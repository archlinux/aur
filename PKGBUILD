# Maintainer: nvlli <nvllvs0 at gmail dot com>

pkgname=dwmblocks-fast-git
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="A modular status bar for window managers (fork of dwmblocks)"
arch=(x86_64)
url="https://github.com/iakobvs/dwmblocks-fast"
license=('ISC')
depends=(libx11
	alsa-lib
	cuda)
makedepends=(git
	make)
optdepends=('dwm: window manager'
	'gst-plugins-base-libs: sound notifications'
	'dunst: popup notifications'
	'pamixer: audio control and monitoring'
	'procps: send signals with pkill')
source=("git+$url")
sha256sums=('SKIP')

prepare() {
	cd dwmblocks-fast
	make config
	echo ''
	echo '======================================================================================='
	echo 'For AUR users:'
	echo '======================================================================================='
	echo 'Pass the desired flags as a variable as DWMBLOCKS_FAST_OPTIONS to makepkg. For example:'
	echo 'DWMBLOCKS_FAST_OPTIONS="disable-nvidia disable-nvml" makepkg -si -f'
	echo ''
	echo 'Current dependencies (which you can disable with DWMBLOCKS_FAST_OPTIONS):'
	echo "${depends[@]}"
}

check() {
	cd dwmblocks-fast
	make -k check
}

build() {
	cd dwmblocks-fast
	if [ -n "$DWMBLOCKS_FAST_OPTIONS" ]; then
		make $DWMBLOCKS_FAST_OPTIONS
	fi
	make
}

package() {
	cd dwmblocks-fast
	make DESTDIR="$pkgdir/" install
}
