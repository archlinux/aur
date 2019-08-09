pkgname=mingw-w64-pagmo
pkgver=2.11.1
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
sha512sums=('7ab1b446efb996422d3c4ab83b359cf8eacef4bb25f3ead2f31afdb6cad6d0c9ead79490f5764f297c44449e960131510733b44f2709fc939e9227021329f3e1')

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
