# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Thomas Ascher <thomas.ascher@gmx.at>

pkgname=yafaray
pkgver=3.4.2
pkgrel=1
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
sha256sums=('eb821e7ba5f4b568021bf24c68c917fd22abc0e94b32066923c597f797e0960a'
            '7f1fe9814bdc7cf64775541b7e5635aa92fc809464462243fada653935aba3ce')

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

