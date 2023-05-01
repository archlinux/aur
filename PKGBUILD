# Maintainer: Luke Labrie-Cleary <luke dot cleary at copenhagenatomics dot com>
pkgname=double-down-git
pkgver=v1.0.0.r8.g74ab1f9
pkgrel=1
pkgdesc="double-down: A double precision interface to Embree"
arch=('x86_64')
url="https://github.com/pshriwise/double-down"
license=('MIT')

depends=(
	moab-git
    embree
)
makedepends=(
	git
	python
	cmake
	binutils
	make
	gcc-fortran
	eigen
        doxygen
)


provides=("${pkgname%-$pkgver}")
source=("${pkgname}::git+${url}.git")
pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
md5sums=('SKIP')

build() {
	cd $srcdir/$pkgname
	mkdir build && cd build
	cmake .. -DMOAB_DIR=/opt/MOAB \
		 -DCMAKE_INSTALL_PREFIX=/opt/double-down
}

package() {
	cd $srcdir/$pkgname/build
	make
	make DESTDIR="$pkgdir/" install
}
