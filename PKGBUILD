# Maintainer: David P. <megver83@parabola.nu>

pkgname=liblinphone
pkgver=4.4.0
pkgrel=1
pkgdesc='A high-level SIP library'
arch=(x86_64 i686)
url='http://www.linphone.org'
license=('GPL')
depends=(belcard belle-sip mediastreamer soci xerces-c lime)
makedepends=(cmake doxygen graphviz python-pystache python-sphinx xsd)
source=("https://gitlab.linphone.org/BC/public/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('a9a468e7e15ad59062d6460b7d2f6b1f1cd74c15d54a7b5dae6bad28a489cf40')

build() {
  cd "$pkgname-$pkgver"
  CXXFLAGS="$CXXFLAGS -Wno-deprecated -Wimplicit-fallthrough=0 -Wno-unused-function"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
      -DENABLE_STATIC=NO \
      -DENABLE_CXX_WRAPPER=YES \
      -DENABLE_DOC=NO \
      -DENABLE_LIME=YES \
      -DENABLE_UNIT_TESTS=NO \
      -DENABLE_STRICT=NO \
      -DCMAKE_INSTALL_RPATH=NO .
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
