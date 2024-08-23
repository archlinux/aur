# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: John Lindgren <john.lindgren@aol.com>

pkgname="libaudclient"
pkgver=3.5.rc2
pkgrel=1
pkgdesc='Legacy D-Bus client library for Audacious'
arch=('x86_64')
url='https://audacious-media-player.org'
license=('BSD-2-Clause')
depends=('glibc' 'glib2' 'dbus-glib')
_pkgsrc="${pkgname}-${pkgver//.rc/-rc}"
source=("${_pkgsrc}.tar.bz2::https://distfiles.audacious-media-player.org/${pkgname}-3.5-rc2.tar.bz2")
sha256sums=('57b59936adee309308bebe6d37709ea7e833e53529164cca0720a337c17f175a')

build() {
  cd "${srcdir}/${_pkgsrc}"
  libtoolize
  autoreconf -vfi
  autoupdate
  ./configure \
    --prefix=/usr
  make
}

package() {
	cd "${srcdir}/${_pkgsrc}"
	make DESTDIR="${pkgdir}" install

	install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "AUTHORS" "${pkgdir}/usr/share/licenses/${pkgname}/AUTHORS"
}
