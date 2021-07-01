pkgname=mingw-w64-spectra09
pkgver=0.9.0
pkgrel=1
pkgdesc="A header-only C++ library for large scale eigenvalue problems (mingw-w64)"
license=('MPL2')
arch=('any')
url="https://spectralib.org/"
depends=('mingw-w64-eigen')
makedepends=('mingw-w64-cmake')
conflicts=('mingw-w64-spectra')
provides=("mingw-w64-spectra=${pkgver}")
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/yixuan/spectra/archive/v${pkgver}.tar.gz")
sha256sums=('2966757d432e8fba5958c2a05ad5674ce34eaae3718dd546c1ba8760b80b7a3d')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"/spectra-$pkgver
    mkdir build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake ..
    make install DESTDIR="$pkgdir"
  done
}

