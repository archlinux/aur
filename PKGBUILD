# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=ompl
pkgver=1.0.0
pkgrel=1
pkgdesc="The Open Motion Planning Library (OMPL) consists of many state-of-the-art sampling-based motion planning algorithms"
arch=('i686' 'x86_64')
url="http://ompl.kavrakilab.org/"
license=('BSD')
depends=('boost-libs' 'python' 'python-matplotlib')
makedepends=('boost' 'cmake')
optdepends=('py++: Python binding'
            'ode: Plan using the Open Dynamics Engine')
source=(https://bitbucket.org/ompl/ompl/downloads/${pkgname}-${pkgver}-Source.tar.gz)
md5sums=('41dc3299459590a2076abfcd468adfe4')
sha256sums=('9bb6242ca723ab49b31fc5ac343a580cb7e6229bcf876c503c235f4cdd75376b')
sha384sums=('a3fb34167a049902db9dbf0d196a6fbd9104db21e014b1d052ef9b38f4d7050686aa1dac9645f6f60ad00bbe846b454c')
sha512sums=('c61e61a59af4b86f72aa90e8f9534805b4e5b69723b3482d3a01df43ce1f6684f82c29d2e96dcaa72bc5da71d25c44c990de48702086383184db09bf395da7c1')

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

check() {
  cd "${srcdir}/${pkgname}-${pkgver}-Source"

  cd build
  #make test
}


package() {
  cd "${srcdir}/${pkgname}-${pkgver}-Source"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd build
  make DESTDIR=${pkgdir} install
}

