# Maintainer: Mirco Tischler <mt-ml at gmx dot de>

pkgname=actor-framework
pkgver=0.14.3
pkgrel=1
pkgdesc="An Open Source Implementation of the Actor Model in C++"
arch=(i686 x86_64)
url="http://actor-framework.org"
license=('custom:"BSD-3-Clause"',
	 'custom:"Boost Software License"')
depends=('boost' 'libcl')
makedepends=('cmake' 'valgrind' 'gperftools' 'protobuf' 'opencl-headers')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/actor-framework/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('da527592f17f540afcb13cf4c0dbf14a56f4ae97c4559ff9beef362555b2d944')

build() {
  cd ${pkgname}-${pkgver}
  # reset CXXFLAGS: cmake will overwrite the project's CXXFLAGS with makepkg's custom flags.
  CXXFLAGS='' ./configure --prefix=/usr
  make
}

check() {
  cd ${pkgname}-${pkgver}
  make test
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 LICENSE_ALTERNATIVE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_ALTERNATIVE"
}
