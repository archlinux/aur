# Maintainer: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgname=arcus-beta
pkgver=3.5
pkgrel=1
pkgdesc="Communication library between internal components for Ultimaker software"
url="https://github.com/Ultimaker/libArcus"
arch=('x86_64')
license=('AGPL')
conflicts=('arcus' 'libarcus-git')
makedepends=('cmake' 'sip')
depends=('python' 'protobuf' 'python-sip')
source=("git+https://github.com/Ultimaker/libArcus#branch=${pkgver}")
md5sums=('SKIP')

build() {
  cd libArcus
  mkdir -p build
  cd build
  
  cmake .. \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_BUILD_TYPE=Release \
  -DBUILD_EXAMPLES=OFF  \
  -DCMAKE_INSTALL_LIBDIR=/usr/lib/

  make
}

package() {
  cd libArcus/build
  make DESTDIR="${pkgdir}" install

  install -Dm644 "${srcdir}/libArcus/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
