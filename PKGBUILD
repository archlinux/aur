# Maintainer: James Spencer <james.s.spencer@gmail.com>
# Contributor: Ghislain Viguier <ghislain.viguier@gmail.com>

pkgname=scalasca
_version=2.3
_patch=
pkgver=${_version}${_patch}
pkgrel=0
pkgdesc="Tool for measuring and analyzing runtime behavior of parallel programs."
arch=('i686' 'x86_64')
url="http://www.scalasca.org/start.html"
license=('custom')
depends=('openmpi')
makedepends=('python2' 'cube-perf' 'scorep' 'openmpi')
install=scalasca.install
source=(http://apps.fz-juelich.de/scalasca/releases/$pkgname/$_version/dist/$pkgname-$pkgver.tar.gz)
sha1sums=('2b7bea7013486a6f6a2031b092c89118aaf4cde5')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr --with-mpi=openmpi PYTHON=/usr/bin/python2 CXXFLAGS='-g -O2 -std=c++03' MPI_CXXFLAGS='-g -O2 -std=c++03'
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR=$pkgdir install
}
