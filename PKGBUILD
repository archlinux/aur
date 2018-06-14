# Maintainer: Timothy Mertz <mertzt89@gmail.com>

pkgname="icecream-sundae"
pkgver=1.0.0
pkgrel=1
pkgdesc="A commandline monitor for Icecream"
arch=('i686' 'x86_64')
url="https://github.com/JPEWdev/icecream-sundae"
license=('GPL2')
depends=('icecream')
makedepends=('git' 'meson' 'gcc' 'automake' 'pkgconfig')
conflicts=('icecream-sundae-git')
source=("${pkgname}::git+${url}#tag=v${pkgver}")
sha512sums=('SKIP')

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

