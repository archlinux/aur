# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=libical
pkgver=3.0.1
pkgrel=1
pkgdesc="An open source reference implementation of the icalendar data type and serialization format"
arch=('x86_64')
url='https://github.com/libical/libical'
license=('LGPL' 'MPL')
depends=('glibc' 'glib2' 'icu' 'db')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('6405964d596aac64fc82c03c4486387fd6a9c09b1f7af1ff251238e66b9e66e1')

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
