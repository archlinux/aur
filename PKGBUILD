# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=libical
pkgver=3.0.5
pkgrel=1
pkgdesc="An open source reference implementation of the icalendar data type and serialization format"
arch=('x86_64')
url='https://github.com/libical/libical'
license=('LGPL' 'MPL')
depends=('glibc' 'glib2' 'icu' 'db')
makedepends=('cmake' 'gtk-doc' 'doxygen' 'vala' 'gobject-introspection')
checkdepends=('python-gobject')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('483acbf7fee66ca071c2ff8183e46b6f2b3a89e1e866eadf4870eaaa281c8db1')

prepare() {
  cd "${pkgname}-${pkgver}"
}

build() {
  cmake -H"${pkgname}-${pkgver}" -Bbuild \
    -DCMAKE_BUILD_TYPE=Plain \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DGOBJECT_INTROSPECTION=true \
    -DICAL_GLIB_VAPI=true \
    -DSHARED_ONLY=true
  cmake --build build
}

check() {
  cmake --build build --target test
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
}
