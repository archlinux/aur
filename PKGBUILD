pkgname=mingw-w64-pagmo
pkgver=2.11.4
pkgrel=1
pkgdesc="Perform parallel computations of optimisation tasks (global and local) via the asynchronous generalized island model (mingw-w64)"
arch=('any')
url="https://github.com/esa/pagmo2"
license=('GPLv3')
depends=('mingw-w64-boost' 'mingw-w64-intel-tbb')
optdepends=('mingw-w64-gsl: Mathematical operations (symbolic)'
	    'mingw-w64-blas: GSL CBLAS functions'
	    'mingw-w64-nlopt: Nonlinear optimization algorithms')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=("https://github.com/esa/pagmo2/archive/v${pkgver}.tar.gz")
sha512sums=('76c9c607b89a549b92101cb1712ef3bdaa8a20e3134479e4a58c61531e4770b9922bf01ee5c895acb1b21670f4e8cbcf8c7781f764ef182da4064939d2099bde')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/pagmo2-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/pagmo2-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
  done
}
