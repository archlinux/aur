# Maintainer: James Spencer <james.s.spencer@gmail.com>
# Contributor: Ghislain Viguier <ghislain.viguier@gmail.com>

pkgname=scalasca
_version=2.2
_patch=.2
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
sha1sums=('9e8d9e3438f4e78431d3424d5ad07d0e76689b62')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr --with-mpi=openmpi PYTHON=/usr/bin/python2
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR=$pkgdir install
}
