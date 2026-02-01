# Maintainer: Jakob Hellermann <jakob.hellermann@protonmail.com>

pkgname=obs-pwvideo
pkgver=0.1.1
pkgrel=1
pkgdesc="OBS Plugin for generic PipeWire video sources"
arch=('x86_64')
url="https://github.com/hoshinolina/obs-pwvideo"
license=('GPL-2.0-or-later')
depends=('libpipewire' 'obs-studio' 'glibc')
makedepends=('cmake')
source=("$pkgname::https://github.com/hoshinolina/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f68a570f6c60964e1d2b4cd9757190f858abded3d0ef51c837c7ce57da2c53cd')

build() {
	local cmake_options=(
		-B build
		-S $pkgname-$pkgver
		-W no-dev
		-D CMAKE_BUILD_TYPE=None
		-D CMAKE_INSTALL_PREFIX=/usr
		-D CMAKE_C_FLAGS="${CFLAGS} -DNDEBUG" # fix source reference
	)
	cmake "${cmake_options[@]}"
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
