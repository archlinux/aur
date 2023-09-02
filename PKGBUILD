# Maintainer: TwoFinger

pkgname=textadept-gtk3
_basename=textadept
pkgver=12.1
pkgrel=1
pkgdesc="Fast, minimalist, and remarkably extensible cross-platform text editor"
arch=(i686 x86_64 aarch64)
url="https://github.com/orbitalquark/textadept"
license=(MIT)
makedepends=(gtk3 ncurses wget unzip cmake)
source=("$url/archive/${_basename}_$pkgver.tar.gz")
sha256sums=(7d71d7b9aa43d6d7a751cd01c0bc76e5c57e967265149871edf761767e2b05ce)

build() {
	cd "${_basename}-${_basename}_$pkgver"
	export LDFLAGS=-Wl,-z,relro,-z,now
	cmake -B build_dir \
		-D CMAKE_INSTALL_PREFIX="$pkgdir"/usr \
		-D CMAKE_BUILD_TYPE=None \
		-D QT=OFF
	cmake --build build_dir -j
}

package_textadept-gtk3() {
	depends=(gtk3 ncurses)
	provides=($pkgname)
	conflicts=(${_basename} ${_basename}-gtk2)

	cd "${_basename}-${_basename}_$pkgver"
	cmake --install build_dir
}
