# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>
pkgname=lib2geom
pkgver=0.2.0
pkgrel=1
pkgdesc="a library developed to provide a robust computational geometry framework"
arch=(i686 x86_64)
url="http://lib2geom.sourceforge.net/"
license=('GPL')
depends=(gtkmm gsl blas boost-libs)
makedepends=(cmake boost)
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver/%\.[0-9]/}/lib2geom-${pkgver}.tar.gz"
	"fix.patch")
md5sums=('983941e4b115a3af9ee95ab2d9cc35e5'
	'eaf3e1f1739cd96a179d25ad23502b36')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	patch -p1 -i "$srcdir/fix.patch"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -p build
	cd build
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr -D2GEOM_BOOST_PYTHON=NO \
		-D2GEOM_BUILD_SHARED=YES -D2GEOM_TOYS=NO \
		-DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir/" install
}
