# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: tytan652 <tytan652@tytanium.xyz>

_reponame=obs-ptz
pkgname="$_reponame-controls"
pkgver=0.19.2
pkgrel=1
pkgdesc='Plugin for OBS Studio to add a PTZ Camera control dock'
arch=(x86_64 aarch64)
url='https://obsproject.com/forum/resources/ptz-controls.1284/'
_url="https://github.com/glikely/$_reponame"
license=(GPL-2.0-or-later)
depends=(obs-studio
         gcc-libs
         glibc
         qt6-base
         qt6-serialport
         sdl2)
makedepends=(cmake
             git
             simde)
source=("git+$_url.git#tag=v$pkgver")
sha256sums=('76ae0f96cecbb94d093dbb99fc69cad424f0e2ef8f6ecd5df3b735b146242532')

build() {
	set -x
	local cmake_options=(
		CMAKE_BUILD_TYPE=None
		CMAKE_INSTALL_PREFIX=/usr
	)
	cmake -B build -S $_reponame -Wno-author "${cmake_options[@]/#/-D }"
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
