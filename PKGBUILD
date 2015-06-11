# Maintainer: Chris Foster <cdbfoster@gmail.com>

pkgname=typoratio-git
pkgver=1.0.r1.gd03e51e
pkgrel=1
pkgdesc="A tool that calculates typographical ratios."
arch=('i686' 'x86_64')
url="http://github.com/cdbfoster/typoratio"
license=('GPL')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+http://github.com/cdbfoster/typoratio")
md5sums=('SKIP')

pkgver() {
	cd "${pkgname%-*}"
	git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
	mkdir -p build
}

build() {
	cd build

	cmake -DCMAKE_BUILD_TYPE=Release "../${pkgname%-*}"
	make
}

package() {
	install -Dm755 "$srcdir/build/typoratio" "$pkgdir/usr/bin/typoratio"
}
