# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=libical
pkgver=2.0.0
pkgrel=2
pkgdesc="An open source reference implementation of the icalendar data type and serialization format"
arch=('i686' 'x86_64')
url='https://github.com/libical/libical'
license=('LGPL' 'MPL')
depends=('glibc')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('ab743a66927284ccf42ee28847550144')

prepare() {
  mkdir build
}

build() {
  cd build

  cmake ../"${pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DSHARED_ONLY=true \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
