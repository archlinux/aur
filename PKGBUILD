pkgname=mingw-w64-pagmo2
pkgver=2.10
pkgrel=1
pkgdesc="Perform parallel computations of optimisation tasks (global and local) via the asynchronous generalized island model (mingw-w64)"
arch=('any')
url="https://github.com/esa/pagmo2"
license=('GPLv3')
depends=('mingw-w64-boost')
optdepends=('mingw-w64-gsl: Mathematical operations (symbolic)'
	    'mingw-w64-blas: GSL CBLAS functions'
	    'mingw-w64-nlopt: Nonlinear optimization algorithms')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=("https://github.com/esa/pagmo2/archive/v${pkgver}.tar.gz")
sha512sums=('87417c105bc887439a7a089d3569e7df942584bf4af4c3fe2df738498bf17be99e450e02ef3d0bf1fdfab5d37cd7a2218aed39492215ed49d9a029a19d143794')

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
