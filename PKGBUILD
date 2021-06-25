# Maintainer: Marcel Hasler <marcel dot hasler at h-brs dot de>
pkgname=sft
pkgver=1.0.1
_pkgname=SFT-${pkgver}
pkgrel=1
pkgdesc="A library for computing the fast Fourier transform (FFT)"
arch=('x86_64')
url="https://github.com/ISF-H-BRS/SFT"
license=('LGPL3')
depends=('gcc-libs')
makedepends=('cmake')
source=("${_pkgname}.tar.gz::https://github.com/ISF-H-BRS/SFT/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4e1a2de9deb8e78d30c355ef56cc567b5c9e7fbb4ab990f2a0415b1e15d1d7ee')

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
