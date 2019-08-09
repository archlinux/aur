pkgname=mingw-w64-pagmo
pkgver=2.11
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
sha512sums=('6b7da56db3e2f1e0627cd84d1ccd7d40f4838ef2e54274d802bd040926dd159e88f692fb6e4146e5e620a10298a539992460ebd3efad611db2e998cb8c20f478')

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
