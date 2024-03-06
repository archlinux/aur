# Maintainer: TwoFinger

pkgname=textadept-curses
_basename=textadept
pkgver=12.3
pkgrel=1
pkgdesc="Fast, minimalist, and remarkably extensible cross-platform text editor"
arch=(i686 x86_64 aarch64)
url="https://github.com/orbitalquark/textadept"
license=(MIT)
makedepends=(ncurses wget unzip cmake)
source=("$url/archive/${_basename}_$pkgver.tar.gz")
sha256sums=(af800b92f4922b454ddca67e5f3c06e18b424b4c593e4d001b9141fe3797f3b4)

build() {
	cd "${_basename}-${_basename}_$pkgver"
	export LDFLAGS=-Wl,-z,relro,-z,now
	cmake -B build_dir \
		-D CMAKE_INSTALL_PREFIX="$pkgdir"/usr \
		-D CMAKE_BUILD_TYPE=None \
		-D GTK2=OFF -D GTK3=OFF -D QT=OFF
	cmake --build build_dir -j
}

package_textadept-curses() {
	depends=(ncurses)
	provides=($pkgname)
	conflicts=(${_basename} ${_basename}-gtk2 ${_basename}-gtk3)

	cd "${_basename}-${_basename}_$pkgver"
	cmake --install build_dir
}
