# Maintainer: Marcel Hasler <marcel dot hasler at h-brs dot de>
pkgname=sft
pkgver=1.0
_pkgname=SFT-${pkgver}
pkgrel=1
pkgdesc="A library for computing the fast Fourier transform (FFT)"
arch=('x86_64')
url="https://github.com/ISF-H-BRS/SFT"
license=('LGPL3')
depends=('gcc-libs')
makedepends=('cmake')
source=("${_pkgname}.tar.gz::https://github.com/ISF-H-BRS/SFT/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('61c1513a452ea1bda50bf7d6676a7eb5b0739d2f56c590d1100297a5cbc7f671')

build() {
  cd ${_pkgname}

  if [[ -d build ]]; then
    rm -rf build
  fi

  rm -rf include/sft/gsl

  mkdir build && cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  make
}

package() {
  cd ${_pkgname}/build
  make install DESTDIR="${pkgdir}"
}
