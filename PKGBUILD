# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: John Lindgren <john.lindgren@aol.com>

pkgname="libaudclient"
pkgver=3.5rc2
pkgrel=1
epoch=1
pkgdesc="Legacy D-Bus client library for Audacious"
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url="https://audacious-media-player.org"
license=('BSD-2-Clause')
depends=('dbus-glib>=0.60' 'glib2>=2.28' 'glibc')
provides=("${pkgname}.so")
_pkgsrc="${pkgname}-${pkgver//rc/-rc}"
source=("${_pkgsrc}.tar.bz2::https://distfiles.audacious-media-player.org/${_pkgsrc}.tar.bz2")
sha256sums=('57b59936adee309308bebe6d37709ea7e833e53529164cca0720a337c17f175a')

build() {
  cd "${srcdir}/${_pkgsrc}"
  # ./autogen.sh
  autoreconf -vfi
  ./configure \
    --prefix='/usr'
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  install -vDm644 "AUTHORS" "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  install -vDm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
