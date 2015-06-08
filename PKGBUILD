# Maintainer: Mirco Tischler <mt-ml at gmx dot de>

pkgname=actor-framework
pkgver=0.13.2
pkgrel=1
pkgdesc="An Open Source Implementation of the Actor Model in C++"
arch=(i686 x86_64)
url="http://actor-framework.org"
license=('custom:"BSD-3-Clause"',
	 'custom:"Boost Software License"')
depends=('boost' 'libcl')
makedepends=('cmake' 'valgrind' 'gperftools' 'protobuf' 'opencl-headers')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/actor-framework/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('3ccf7e469740e750eef31f14b965b00f7b6e3a89b05086a088ca905b3b1a04e6')

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
