
pkgname=sundials
pkgver=2.7.0
pkgrel=2
pkgdesc="Suite of nonlinear differential/algebraic equation solvers"
arch=('i686' 'x86_64')
url="https://computation.llnl.gov/casc/sundials/main.html"
license=('BSD')
depends=('gcc-libs' 'lapack' 'gcc-fortran' 'openmpi')
makedepends=('cmake')
source=("http://computation.llnl.gov/projects/sundials/download/$pkgname-$pkgver.tar.gz")
sha256sums=('d39fcac7175d701398e4eb209f7e92a5b30a78358d4a0c0fcc23db23c11ba104')

build() {
	rm -rf build
	mkdir build  &&  cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr	\
	      -DMPI_ENABLE=ON	\
	      -DLAPACK_ENABLE=ON	\
	      -DEXAMPLES_ENABLE=ON	\
	      -DEXAMPLES_INSTALL=ON	\
	      -DEXAMPLES_INSTALL_PATH=/usr/share/"$pkgname-$pkgver"/examples	\
	      ../$pkgname-$pkgver
	make
}

package() {
	local doc="$pkgdir/usr/share/doc/$pkgname-$pkgver"
	mkdir -p $doc
	find . -name \*.pdf -exec cp -p {} "$doc" \;
	make -C build DESTDIR="$pkgdir" install
}

