# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=arcus
pkgver=2.4.0
pkgrel=1
pkgdesc="Communication library between internal components for Ultimaker software"
url="https://github.com/Ultimaker/libArcus"
arch=('x86_64')
arch=('any')
license=('GPLv3')

makedepends=('cmake')
depends=('python' 'protobuf' 'python-sip')
source=(https://github.com/Ultimaker/libArcus/archive/${pkgver}.tar.gz)
md5sums=('d726e90657760488da79480be333e0c7')

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

  mv "${pkgdir}"/usr/lib64/* "${pkgdir}"/usr/lib/.
  rm -rf "${pkgdir}/usr/lib64"
  
  install -Dm644 "${srcdir}/libArcus-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
