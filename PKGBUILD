pkgname=mingw-w64-spectra
pkgver=1.1.0
pkgrel=1
pkgdesc="A header-only C++ library for large scale eigenvalue problems (mingw-w64)"
license=('MPL2')
arch=('any')
url="https://spectralib.org/"
depends=('mingw-w64-eigen')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/yixuan/spectra/archive/v${pkgver}.tar.gz")
sha256sums=('d29671e3d1b8036728933cadfddb05668a3cd6133331e91fc4535a9b85bedc79')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"/spectra-$pkgver
    mkdir build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake ..
    make install DESTDIR="$pkgdir"
  done
}

