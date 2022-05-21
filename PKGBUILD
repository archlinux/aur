# Maintainer: Abheek Dhawan <abheekd at protonmail dot com>

pkgname="wwise-audio-tools-git"
pkgver=0.5.2.r0.g3f1ed9d
pkgrel=1
pkgdesc="Tools for working with Wwise file types (only extraction at the moment)"
arch=("x86_64")
url="https://github.com/WolvenKit/wwise-audio-tools"
license=("MIT")
makedepends=("cmake" "ninja" "git")
source=("git+https://github.com/WolvenKit/wwise-audio-tools")
sha512sums=("SKIP")

pkgver() {
  cd ${srcdir}/wwise-audio-tools
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/wwise-audio-tools"
	git submodule update --init
}

build() {
	cmake -G "Ninja" -B build -S "${srcdir}/wwise-audio-tools" \
		-DCMAKE_INSTALL_PREFIX="/usr" \
		-Wno-dev
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" PREFIX="usr" cmake --install build
}
