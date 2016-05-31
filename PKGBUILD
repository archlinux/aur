# Maintainer: James Spencer <james.s.spencer@gmail.com>
# Contributor: Ghislain Viguier <ghislain.viguier@gmail.com>

pkgname=scalasca
_version=2.3
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
sha1sums=('55d9803d07d140e07d91dbbc5c7a172d951e8929')

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
