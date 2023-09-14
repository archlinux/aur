# Maintainer jorge-barroso <jorge_barroso_11 at hotmail dot com>
# Contributor DanielNak <daniel@tee.cat>
# Library package author: Timothy A. Davis <Davis@tamu.edu>

_author=DrTimothyAldenDavis
_pkgname=GraphBLAS
pkgname=graphblas
pkgver=8.0.2
pkgrel=1
pkgdesc="A full implementation of the GraphBLAS standard (graphblas.org)"
arch=('any')
url="http://github.com/$_author/$_pkgname"
license=('APACHE')
depends=()
makedepends=('cmake')
provides=("$pkgname")
conflicts=("$pkgname")
# source=("http://faculty.cse.tamu.edu/$_author/$_pkgname/$_pkgname-$pkgver.tar.gz")
source=("https://github.com/$_author/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cedecdcff130c3b7e5d571b693dc2c28bc96ef5f09b33e52f0bcd42b23593ea0')

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	(( NJOB=$(nproc)-1 )) || NJOB=1
	make library JOBS=$NJOB CMAKE_OPTIONS=-DCMAKE_INSTALL_PREFIX=/usr
}

package(){
	cd "$srcdir/$_pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	# install -Dm644 Doc/License.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	cd "$pkgdir/usr"
}
