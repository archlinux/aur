# Contributor: TwoFinger

pkgname=textadept-curses
_basename=textadept
pkgver=12.5
pkgrel=1
pkgdesc="Fast, minimalist, and remarkably extensible cross-platform text editor"
arch=(i686 x86_64 aarch64)
url="https://github.com/orbitalquark/textadept"
license=(MIT)
makedepends=(ncurses wget unzip cmake)
source=("$url/archive/${_basename}_$pkgver.tar.gz")
sha256sums=('ff59d2240c8169563c9a39eb19b65788dcde0a4f327c7d028b23dafc9d85a8d4')

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
