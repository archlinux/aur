# Maintainer: Jakob Hellermann <jakob.hellermann@protonmail.com>

pkgname=obs-pwvideo
pkgver=0.1.0
pkgrel=1
pkgdesc="OBS Plugin for generic PipeWire video sources"
arch=('x86_64')
url="https://github.com/hoshinolina/obs-pwvideo"
license=('GPL-2.0-or-later')
depends=('libpipewire' 'obs-studio' 'glibc')
makedepends=('cmake')
source=("$pkgname::https://github.com/hoshinolina/$pkgname/archive/refs/tags/0.1.0.tar.gz")
sha256sums=('789423a2e05a8258638178d7713fff9e093c7c5d0b9bd6c72c7bb4e4cd4af3eb')

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
