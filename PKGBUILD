# Maintainer: DanManN <dnahimov@gmail.com>
# Library package author: Timothy A. Davis <Davis@tamu.edu>

_author=davis
_pkgname=GraphBLAS
pkgname=graphblas
pkgver=3.0.1
pkgrel=1
pkgdesc="A full implementation of the GraphBLAS standard (graphblas.org)"
arch=('any')
url="http://faculty.cse.tamu.edu/$_author/$_pkgname.html"
license=('APACHE')
depends=()
makedepends=('cmake')
provides=("$pkgname")
conflicts=("$pkgname")
source=("http://faculty.cse.tamu.edu/$_author/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('1f864b8ec7763001484b2220e5183a7fe2c09b73bf75b394ab5ea6b7a2e7f41a')

build() {
	cd "$srcdir/$_pkgname"
	(( NJOB=$(nproc)-1 )) || NJOB=1
	make library JOBS=$NJOB CMAKE_OPTIONS=-DCMAKE_INSTALL_PREFIX=/usr
}

package(){
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir/" install
	# install -Dm644 Doc/License.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	cd "$pkgdir/usr"
	mv lib64 lib
}
