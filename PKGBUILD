# Maintainer: Timothy Mertz <mertzt89@gmail.com>

pkgname="icecream-sundae-git"
pkgver=df4240e
pkgrel=1
pkgdesc="A commandline monitor for Icecream. Git version."
arch=('i686' 'x86_64')
url="https://github.com/JPEWdev/icecream-sundae"
license=('GPL2')
depends=('icecream')
makedepends=('git' 'meson' 'gcc' 'automake' 'pkgconfig')
conflicts=('icecream-sundae')
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	git describe --always | sed 's/-/./g'
}

build() {
	cd "${pkgname}"
	meson --buildtype release --prefix /usr build
	ninja -C build
}

check() {
	cd "${pkgname}"
	ninja -C build test
}

package() {
	cd "${pkgname}"
	DESTDIR="$pkgdir/" ninja -C build install
}

