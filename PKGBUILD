# Maintainer: TwoFinger
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Tom <reztho@archlinux.org>
# Contributor: bitwave

pkgname=textadept
_basename=textadept
pkgver=12.2
pkgrel=1
pkgdesc="Fast, minimalist, and remarkably extensible cross-platform text editor"
arch=(i686 x86_64 aarch64)
url="https://github.com/orbitalquark/textadept"
license=(MIT)
makedepends=(qt5-base ncurses wget unzip cmake)
source=("$url/archive/${_basename}_$pkgver.tar.gz")
sha256sums=(1e5b6eca26dbdb06b8aca1c1f743a28674c2205bf8870a1e6f3a2da9f57f4071)

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
