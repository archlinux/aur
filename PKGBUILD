# Maintainer: Jonas Witschel <diabonas@archlinux.org>

pkgname=qpwgraph
pkgver=0.4.1
pkgrel=1
pkgdesc='PipeWire Graph Qt GUI Interface'
arch=('x86_64')
url='https://gitlab.freedesktop.org/rncbc/qpwgraph'
license=('GPL3')
groups=('pro-audio')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'qt6-base' 'qt6-svg')
makedepends=('alsa-lib' 'cmake' 'pipewire')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('6b942537a9a5f73dbf604c5566dbe66bec5762098b675ffc314a624387c7a170d6b8132742f7ca71476fb4107efadb09a7b295e088fcbbbc95a48cdcc1c2f1a1')

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
