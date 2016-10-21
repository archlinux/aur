# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=arcus
pkgver=2.3.0
pkgrel=1
pkgdesc="Communication library between internal components for Ultimaker software"
url="https://github.com/Ultimaker/libArcus"
arch=('x86_64')
arch=('any')
license=('GPLv3')

makedepends=('cmake')
depends=('python' 'protobuf3' 'python-sip')
source=(https://github.com/Ultimaker/libArcus/archive/${pkgver}.tar.gz)
md5sums=('61b198b0ba5b6a1570c9f19e2e63ab95')

build() {
  cd libArcus-${pkgver}
  mkdir -p build
  cd build
  
  cmake .. \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_BUILD_TYPE=Release \
  -DBUILD_EXAMPLES=OFF 

  make
}

package() {
  cd libArcus-${pkgver}/build
  make DESTDIR="${pkgdir}" install
  
  install -Dm644 "${srcdir}/libArcus-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
