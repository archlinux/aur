#
# PKGBUILD for cone-simple
#
# cone-simple is an stripped package build of cone
#
# This version has no dependencies to other courier libraries (other than the minimal courier-unicode).
#
# Contributor: Uffe Jakobsen <uffe@uffe.org>
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
#
#

pkgname=cone-simple
pkgver=1.16
pkgrel=1
epoch=
pkgdesc="Curses text-based mail client - handles multiple POP3, IMAP accounts, and local mail folders. contains a simple newsreader. This version has no dependencies to courier libraries (other than the mandatory courier-unicode)."
arch=('i686' 'x86_64')
_pkgname=cone
url="http://courier-mta.org/cone/"
license=('GPL-3.0-only')
#groups=()
makedepends=('procps-ng')
depends=('libxml2' 'libidn2' 'libldap' 'aspell' 'courier-unicode')
checkdepends=()
#optdepends=()
provides=('cone')
#conflicts=()
#replaces=()
#backup=()
#options=()
#install=
#changelog=

source=(http://sourceforge.net/projects/courier/files/cone/${pkgver}/cone-${pkgver}.tar.bz2)

#noextract=()

sha256sums=('d9421cfa5ca896c0d2327e0c1a798e61490b6db0fe87a14c7cd21128e01005f2')

#
#
#

prepare()
{
  cd "${srcdir}/${_pkgname}-${pkgver}"
}

build()
{
  cd "${srcdir}/${_pkgname}-${pkgver}"
  "${srcdir}/${_pkgname}-${pkgver}/configure" -C --without-db --with-certdb=/usr/share/cone/rootcerts --prefix=/usr --exec-prefix=/usr --libexecdir=/usr/lib/cone --sysconfdir=/etc --with-notice=unicode
  make
}

check()
{
  cd "${srcdir}/${_pkgname}-${pkgver}"
  #make -k check
}

package()
{
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -m 644 -D "COPYING" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
  install -m 644 -D "COPYING.GPL" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING.GPL"

}

# EOF
