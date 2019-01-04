# Maintainer: Zacharias Knudsen <zachasme@gmail.com>
pkgname=h3-git
pkgver=v3.3.0.r0.g6af4914
pkgrel=1
pkgdesc="Hexagonal hierarchical geospatial indexing system"
arch=('x86_64')
url="https://github.com/uber/h3"
license=('Apache')
makedepends=('git' 'cmake' 'make' 'gcc' 'libtool')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+https://github.com/uber/h3.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $pkgname
	cmake -DBUILD_SHARED_LIBS=1 -DCMAKE_INSTALL_PREFIX:PATH=/usr .
    make
}

check() {
	cd $pkgname
	make test
}

package() {
	cd $pkgname
	make DESTDIR="$pkgdir" install
}
