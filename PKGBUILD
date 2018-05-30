# Contributor: Charles Bos <charlesbos1 AT gmail>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=libical2
_srcname=libical
pkgver=2.0.0
pkgrel=1
pkgdesc="An open source reference implementation of the icalendar data type and serialization format (version 2)"
arch=('armv7h' 'x86_64')
url='https://github.com/libical/libical'
license=('LGPL' 'MPL')
depends=('glibc' 'glib2' 'icu' 'db')
provides=("${_srcname}=${pkgver}")
conflicts=("${_srcname}")
makedepends=('cmake')
source=("${_srcname}-${pkgver}.tar.gz::https://github.com/${_srcname}/${_srcname}/archive/v${pkgver}.tar.gz")
sha256sums=('20f4a98475052e1200d2691ba50b27969e4bedc6e50bffd5e2fa81f4ac90de9a')

prepare() {
  mkdir build
}

build() {
  cd build

  cmake ../"${_srcname}-${pkgver}" \
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
