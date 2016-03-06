# Maintainer: Daniel Haß <aur@hass.onl>
# Contributor: Ronald van Haren <ronald@archlinux.org>
# Contributor: Enlightenment Developers <enlightenment-devel@enlightenment.org>

_pkgname=emotion_generic_players
pkgname=$_pkgname-fresh
pkgver=1.17.0
pkgrel=1
pkgdesc="EFL emotion generic players - updated stable version"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('BSD')
depends=('efl-fresh' 'vlc')
makedep=('make')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!emptydirs')
source=(http://download.enlightenment.org/rel/libs/${_pkgname}/${_pkgname}-${pkgver}.tar.xz)
sha256sums=('e7de008b4ceea3df0fc2e82248fbf96f645a6989858d0d8a2c0ccc5a12c56a0e')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  export CFLAGS="$CFLAGS -fvisibility=hidden"

  ./configure \
    --prefix=/usr
  make
}

package(){
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install

  # install license files
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/COPYING" \
  	"${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
}

