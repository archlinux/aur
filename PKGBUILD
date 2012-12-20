# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=ompl
pkgver=0.12.1
pkgrel=1
pkgdesc="The Open Motion Planning Library (OMPL) consists of many state-of-the-art sampling-based motion planning algorithms"
arch=('i686' 'x86_64')
url="http://ompl.kavrakilab.org/"
license=('BSD')
depends=('boost-libs' 'python')
makedepends=('boost' 'cmake')
optdepends=('py++: Python binding'
            'ode: Plan using the Open Dynamics Engine')
source=(https://bitbucket.org/ompl/ompl/downloads/${pkgname}-${pkgver}-Source.tar.gz)
md5sums=('4e55ad95e45b99d854e70b805f1313f8')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}-Source"

  rm -rf build
  mkdir build
  cd build

  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPYTHON_EXEC=/usr/bin/python2 \
    -DCMAKE_CXX_FLAGS=-D_POSIX_VERSION \
    -DOMPL_REGISTRATION=Off ..
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-Source"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd build
  make DESTDIR=${pkgdir} install
}

