# Maintainer: Daniel Haß <aur@hass.onl>
# Contributor: Ronald van Haren <ronald@archlinux.org>
# Contributor: Gustavo Sverzut Barbieri <barbieri@gmail.com>

_pkgname=evas_generic_loaders
pkgname=$_pkgname-fresh
pkgver=1.17.0
pkgrel=1
pkgdesc="Additional generic loaders for Evas - updated stable version"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('GPL2')
depends=('librsvg' 'poppler' 'libraw' 'libspectre' 'efl-fresh')
makedep=('make')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!emptydirs')
source=(http://download.enlightenment.org/rel/libs/${_pkgname}/${_pkgname}-${pkgver}.tar.xz)
sha256sums=('c2f5193a9326532d3ab3ff76f547b9d17b33ae7221ce4d6e0aefb905ba0dd87a')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  export CFLAGS="$CFLAGS -fvisibility=hidden"

  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib/evas \
    --enable-poppler \
    --enable-spectre \
    --enable-libraw \
    --enable-svg \
    --enable-gstreamer
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

