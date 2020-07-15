# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Thomas Ascher <thomas.ascher@gmx.at>

pkgname=yafaray
pkgver=3.5.1
pkgrel=2
pkgdesc="A free open-source montecarlo raytracing engine"
arch=('x86_64')
url="http://yafaray.org/"
license=('LGPL2.1')
depends=('boost-libs' 'opencv' 'qt5-base')
optdepends=('python: For Python bindings'
            'ruby: For Ruby bindings')
makedepends=('cmake' 'boost' 'swig' 'python' 'ruby')
source=("Core-${pkgver}.tar.gz::https://github.com/YafaRay/Core/archive/v${pkgver}.tar.gz"
        "ruby-archhdrdir.patch")
sha256sums=('a8fca4f67836e944f1f07e26effb06d760db243a997b127913b5541612467224'
            '77031b3ed36f836d44feefbd97f46a190acbb552882a9ff5968e3600957ac93d')

prepare() {
  cd "${srcdir}/Core-${pkgver}"

  patch -Np1 < "${srcdir}/ruby-archhdrdir.patch"
}

build() {
  cd "${srcdir}/Core-${pkgver}"

  mkdir -p build
  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_QT=ON \
    -DYAF_PY_VERSION=3.8 \
    -DYAF_BINDINGS_PY_DIR=/usr/lib/python3.8/site-packages ..
  make
}

package() {
  cd "${srcdir}/Core-${pkgver}/build"

  make DESTDIR="${pkgdir}" install
}

