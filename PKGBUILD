# Maintainer: Chris Foster <cdbfoster@gmail.com>
pkgname=typoratio-git
pkgver=1.0.r1.gd03e51e
pkgrel=1
pkgdesc="A tool that calculates typographical ratios."
arch=('i686' 'x86_64')
url="http://github.com/cdbfoster/typoratio"
license=('GPL')
provides=('typoratio')
conflicts=('typoratio')
source=('typoratio-git::git+http://github.com/cdbfoster/typoratio')
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	mkdir build
	cd build
	cmake "../$pkgname" -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir/" install
}
