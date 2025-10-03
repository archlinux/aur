# Contributor: TwoFinger
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Tom <reztho@archlinux.org>
# Contributor: bitwave

pkgname=textadept
_basename=textadept
pkgver=12.9
pkgrel=1
pkgdesc="Fast, minimalist, and remarkably extensible cross-platform text editor"
arch=(i686 x86_64 aarch64)
url="https://github.com/orbitalquark/textadept"
license=(MIT)
depends=(qt6-base qt6-5compat ncurses)
makedepends=(wget unzip cmake)
source=("$url/archive/${_basename}_$pkgver.tar.gz")
sha256sums=('912cfacd787d2412be0bca92dbaab68271762c39e6d449b9cff5ae5e4c0025ee')


build() {
	cd "${_basename}-${_basename}_$pkgver"
	export LDFLAGS=-Wl,-z,relro,-z,now
	cmake -B build_dir \
		-D CMAKE_INSTALL_PREFIX="$pkgdir"/usr \
		-D CMAKE_BUILD_TYPE=None \
		-D GTK2=OFF -D GTK3=OFF
	cmake --build build_dir -j
}

package() {
	cd "${_basename}-${_basename}_$pkgver"
	cmake --install build_dir
}
