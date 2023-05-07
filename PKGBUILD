# Maintainer: Jonas Witschel <diabonas@archlinux.org>

pkgname=qpwgraph
pkgver=0.4.2
pkgrel=1
pkgdesc='PipeWire Graph Qt GUI Interface'
arch=('x86_64')
url='https://gitlab.freedesktop.org/rncbc/qpwgraph'
license=('GPL3')
groups=('pro-audio')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'qt6-base' 'qt6-svg')
makedepends=('alsa-lib' 'cmake' 'pipewire')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('3abc838ca3688b2f14c619d193db732be6dc51fe68820a63f18fc678221591788a24f24909fdb63ba567c3296179ab123ba9964779d2d62cc68c3c8a714541f2')

build() {
	cmake -B build -S "$pkgname-v$pkgver" -DCMAKE_BUILD_TYPE=None \
	      -DCMAKE_INSTALL_PREFIX=/usr -DCONFIG_WAYLAND=ON
	cmake --build build
}

package() {
	depends+=(
		alsa-lib libasound.so
		pipewire libpipewire-0.3.so
	)
	DESTDIR="$pkgdir" cmake --install build
}
