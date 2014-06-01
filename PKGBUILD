# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=ompl
pkgver=0.14.2
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
md5sums=('43ea02ca9ffff1719a87edf570874eaf')
sha256sums=('a3a0f328d7acb22b20f6aab45a7dbf5b5182dc0c959a967232cccca5ad2de2b1')
sha384sums=('d5d3dad206208939611257d64a2aa2042414318243b3685b45a21dc77639f201989b4f53bdf1ab1058755e696a65573f')
sha512sums=('e2df279622dbeccfa28e8ed3ff7f46ad94bdc978599207aff74622e954591736c4e9b9a1b828c330059b12ed655293360a8e92d805c7082b9036c066799c5d45')

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

