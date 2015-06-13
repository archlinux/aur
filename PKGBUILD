# Maintainer: James Spencer <james.s.spencer@gmail.com>
# Contributor: Ghislain Viguier <ghislain.viguier@gmail.com>

pkgname=scalasca
_version=2.2
_patch=.1
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
sha1sums=('316778462f502705277497bd6e2ea02d9cbe9b90')

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
