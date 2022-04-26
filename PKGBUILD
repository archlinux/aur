# Maintainer: Marcel Hasler <marcel dot hasler at h-brs dot de>
pkgname=sft
pkgver=1.0.2
_pkgname=SFT-${pkgver}
pkgrel=1
pkgdesc="A library for computing the fast Fourier transform (FFT)"
arch=('x86_64')
url="https://github.com/ISF-H-BRS/SFT"
license=('LGPL3')
depends=('gcc-libs')
makedepends=('cmake')
source=("${_pkgname}.tar.gz::https://github.com/ISF-H-BRS/SFT/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3c0bf62fb1d63297d80ed2361b34e75fef1e207e76db42960fa34f1ed404880a')

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
