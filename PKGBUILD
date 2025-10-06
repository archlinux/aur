# Contributor: TwoFinger

pkgname=textadept-curses
_basename=textadept
pkgver=12.9
pkgrel=2
pkgdesc="Fast, minimalist, and remarkably extensible cross-platform text editor"
arch=(i686 x86_64 aarch64)
url="https://github.com/orbitalquark/textadept"
license=(MIT)
makedepends=(ncurses wget unzip cmake)
source=("$url/archive/${_basename}_$pkgver.tar.gz")
sha256sums=('b675549ea3a77638f7bc02cf0f065c35eb2b3eb8ea721c40ea4539752a14b08b')

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
