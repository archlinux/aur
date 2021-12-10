# Maintainer : Jay Tsung<int8@foxmail.com>
# Contributor: <aur@entropy-collector.net>
pkgname=libradtran
_pkgname=libRadtran
pkgver=2.0.4
pkgrel=1
pkgdesc="library for radiative transfer"
arch=('x86_64')
url="http://www.libradtran.org"
license=('GPL')
depends=('netcdf'
         'gsl')
makedepends=('python2'
             'gcc-fortran')
optdepends=('perl: run the tests and some of the tools')
source=("http://www.libradtran.org/download/$_pkgname-$pkgver.tar.gz"
        "$_pkgname-$pkgver.patch")
sha256sums=('eb840e00f2b59648e77775df83d8ae2337880cec155d145228cd65365e3c816f'
            'a6207444d9ae8bc47f5150ed318bd43fc8a6a95005792e1b919d9605d3c34ce2')

prepare() {
	cd "$_pkgname-$pkgver"
	find -name .depend -delete
	patch -p1 -i "$srcdir/$_pkgname-$pkgver.patch"
}

build() {
	cd "$_pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$_pkgname-$pkgver"
	make prefix="$pkgdir/usr/" install
}
