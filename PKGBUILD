# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Thomas Ascher <thomas.ascher@gmx.at>

pkgname=yafaray
pkgver=3.4.0
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
md5sums=('3fe60ef428ad4b433c1fad0485a7bfb9'
         'e403c2aa8860e6d55629f9cb3dc150d8')

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

