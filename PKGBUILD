pkgname=mingw-w64-spectra
pkgver=1.2.0
pkgrel=1
pkgdesc="A header-only C++ library for large scale eigenvalue problems (mingw-w64)"
license=('MPL2')
arch=('any')
url="https://spectralib.org/"
depends=('mingw-w64-eigen')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/yixuan/spectra/archive/v${pkgver}.tar.gz")
sha256sums=('fdfccacba1c77d9b4ffefae7258c760c99e3c8a2823ca87ea5b11a50d297a73b')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"/spectra-$pkgver
    mkdir build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake ..
    make install DESTDIR="$pkgdir"
  done
}

