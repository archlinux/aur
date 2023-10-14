# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=libical
pkgver=3.0.17
pkgrel=1
pkgdesc="An open source reference implementation of the icalendar data type and serialization format"
arch=('x86_64')
url='https://github.com/libical/libical'
license=('LGPL' 'MPL')
depends=('glibc' 'glib2' 'icu' 'libxml2')
makedepends=('cmake' 'ninja' 'gtk-doc' 'doxygen' 'vala' 'gobject-introspection')
checkdepends=('python-gobject')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('11fbb4aba7503a3264b0efa30ad56aa923d31ec193bdb0b87b92bc88db9019fa670c8c9ee7998caa3a870e706446a58ead475f31bd703f0d2cb7aabf0f6a3aa7')

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
