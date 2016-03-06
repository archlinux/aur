# Maintainer: Daniel Haß <aur@hass.onl>
# Contributor: Ronald van Haren <ronald@archlinux.org>
# Contributor: Gustavo Sverzut Barbieri <barbieri@gmail.com>

_pkgname=elementary
pkgname=$_pkgname-fresh
pkgver=1.17.0
pkgrel=1
pkgdesc="Enlightenment's widget set - updated stable version"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('BSD')
depends=('efl-fresh' 'evas_generic_loaders-fresh' 'emotion_generic_players-fresh')
makedepends=('make')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!emptydirs')
source=(http://download.enlightenment.org/rel/libs/${_pkgname}/${_pkgname}-${pkgver}.tar.xz)
sha256sums=('6a6a5883939eab8d87179c7980c0dbd6b53d82bf460a161045a891694d036b2b')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  export CFLAGS="$CFLAGS -fvisibility=hidden"

  ./configure \
    --prefix=/usr \
    --disable-static
  make
}

package(){
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install

  # install license files
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/COPYING" \
        "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
}

