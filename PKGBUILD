# Maintainer: Moritz Poldrack <moritz at poldrack dot dev>
pkgname=yambar
pkgver=1.6.2
pkgrel=1
pkgdesc='Modular status panel for X11 and Wayland, inspired by polybar'
arch=('x86_64')
url='https://codeberg.org/dnkl/yambar'
license=('MIT')
depends=(
		'alsa-lib'
		'libmpdclient'
		'libxcb'
		'xorgproto'
		'libyaml'
		'systemd'
		'fontconfig'
		wayland{,-protocols}
		xcb-util{,-cursor,-errors,-wm}
		'pixman'
	)
makedepends=(
		'git'
		'meson'
		'scdoc'
	    )
provides=('yambar')
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/dnkl/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('cb0813d5f8ce72d536e5b0714c773fd2b3ea0cb5e22b020b9ec0e33645040d3c')

prepare() {
		cd yambar

		pushd subprojects
		git clone https://codeberg.org/dnkl/tllist.git
		git clone https://codeberg.org/dnkl/fcft.git
		popd

		mkdir -p bld/release && cd bld/release
		meson --buildtype=release --prefix=${pkgdir}/usr/ ../..
}

build() {
	cd "${srcdir}/yambar/bld/release";
	ninja
}

package() {
	cd "${srcdir}/yambar/bld/release";
	ninja install
}
