# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=qpwgraph
pkgver=0.3.9
pkgrel=1
pkgdesc='PipeWire Graph Qt GUI Interface'
arch=('x86_64')
url='https://gitlab.freedesktop.org/rncbc/qpwgraph'
license=('GPL3')
groups=('pro-audio')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'qt6-base' 'qt6-svg')
makedepends=('alsa-lib' 'cmake' 'pipewire')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('b65bd5b614652d461137d1f6b79e252b33fd38a3d4239be8cc38c5011adb34959b7f5e9e3f25c27afb74925e1d6b86c65413e73d1874c5bbc9a8d72b626b4f40')

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
