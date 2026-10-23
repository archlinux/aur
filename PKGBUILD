# Maintainer: Reycko <reycko (at) reycko (dot) xyz>

pkgver=r216.f63b64b
pkgrel=1
pkgname=libspecbleach-git
pkgdesc="C library for audio noise reduction. Contains extras"
arch=( 'i686' 'x86_64' )
makedepends=( 'cmake' )
license=( 'LGPL2.1' )
source=( "${pkgname%-*}::git+https://github.com/lucianodato/libspecbleach.git" )
md5sums=( 'SKIP' )
conflicts=( "${pkgname%-*}" "${pkgname%-*}-bin" )

pkgver() {
	cd "${pkgname%-*}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${pkgname%-*}"

	cmake -B build -DCMAKE_BUILD_TYPE=Release -DSPECBLEACH_BUILD_EXTRAS=ON
	cmake --build build --config Release --parallel
}

package() {
	cd "${pkgname%-*}"

	DESTDIR="$pkgdir" cmake --install build --prefix /usr
}

