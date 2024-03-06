# Maintainer: TwoFinger
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Tom <reztho@archlinux.org>
# Contributor: bitwave

pkgname=textadept
_basename=textadept
pkgver=12.3
pkgrel=1
pkgdesc="Fast, minimalist, and remarkably extensible cross-platform text editor"
arch=(i686 x86_64 aarch64)
url="https://github.com/orbitalquark/textadept"
license=(MIT)
makedepends=(qt5-base ncurses wget unzip cmake)
source=("$url/archive/${_basename}_$pkgver.tar.gz")
sha256sums=(af800b92f4922b454ddca67e5f3c06e18b424b4c593e4d001b9141fe3797f3b4)

build() {
	cd "${_basename}-${_basename}_$pkgver"
	export LDFLAGS=-Wl,-z,relro,-z,now
	cmake -B build_dir \
		-D CMAKE_INSTALL_PREFIX="$pkgdir"/usr \
		-D CMAKE_BUILD_TYPE=None \
		-D GTK2=OFF -D GTK3=OFF
	cmake --build build_dir -j
}

package_textadept() {
	depends=(qt5-base ncurses)

	cd "${_basename}-${_basename}_$pkgver"
	cmake --install build_dir
}
