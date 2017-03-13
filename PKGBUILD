# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=ompl
pkgver=1.3.0
pkgrel=1
pkgdesc="The Open Motion Planning Library (OMPL) consists of many state-of-the-art sampling-based motion planning algorithms"
arch=('i686' 'x86_64')
url="http://ompl.kavrakilab.org/"
license=('BSD')
depends=('boost-libs' 'python' 'python-matplotlib')
makedepends=('boost' 'cmake')
optdepends=('py++: Python binding'
            'ode: Plan using the Open Dynamics Engine'
            'eigen: For an informed sampling technique')
source=(https://bitbucket.org/ompl/ompl/downloads/${pkgname}-${pkgver}-Source.tar.gz)
sha512sums=('9b4a7e4a6d7992ec4456d647f3fe1ea593552fea471ac99e395cfb1a2842a6e1659ad390f8c83512d8ef3043e17ef382a1a5de6867e9fd18cdb56983cba68e35')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}-Source"

  rm -rf build
  mkdir build
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}-Source/build"

  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DPYTHON_EXEC=/usr/bin/python2 \
    -DCMAKE_CXX_FLAGS=-D_POSIX_VERSION \
    -DOMPL_REGISTRATION=Off ..
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}-Source/build"

  #make test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-Source"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd build
  make DESTDIR=${pkgdir} install
}
