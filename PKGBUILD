# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=libical
pkgver=3.0.18
pkgrel=1
pkgdesc="An open source reference implementation of the icalendar data type and serialization format"
arch=('x86_64')
url='https://github.com/libical/libical'
license=('LGPL' 'MPL')
depends=('glibc' 'glib2' 'icu' 'libxml2')
makedepends=('cmake' 'ninja' 'gtk-doc' 'doxygen' 'vala' 'gobject-introspection')
checkdepends=('python-gobject')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('53ecf6c14a68d569dd11bfdeb1a072def847a14d189c6af16eab202e004350ee7d9488c6b63e9cb67889e8c2dec90643fef46aec143a915f28270d0752eaa9d5')

build() {
  cmake -S "${pkgname}-${pkgver}" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DGOBJECT_INTROSPECTION=true \
    -DICAL_GLIB_VAPI=true \
    -DSHARED_ONLY=true \
    -DCMAKE_DISABLE_FIND_PACKAGE_BerkeleyDB=true
  cmake --build build
}

check() {
  cmake --build build --target test
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
