# Maintainer: TwoFinger
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Tom <reztho@archlinux.org>
# Contributor: bitwave

pkgname=textadept
_basename=textadept
pkgver=12.4
pkgrel=1
pkgdesc="Fast, minimalist, and remarkably extensible cross-platform text editor"
arch=(i686 x86_64 aarch64)
url="https://github.com/orbitalquark/textadept"
license=(MIT)
makedepends=(qt5-base ncurses wget unzip cmake)
source=("$url/archive/${_basename}_$pkgver.tar.gz")
sha256sums=(a9c3952d4055007c3bc9c65d685adb5a8abdb589646623d7141fc709d86464c2)

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
