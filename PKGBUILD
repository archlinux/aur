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
# 20210324: cone-1.2 fails check
#

pkgname=cone-simple
pkgver=1.12
pkgrel=1
epoch=
pkgdesc="Curses text-based mail client - handles multiple POP3, IMAP accounts, and local mail folders. contains a simple newsreader. This version has no dependencies to courier libraries (other than the mandatory courier-unicode)."
arch=('i686' 'x86_64')
_pkgname=cone
url="http://courier-mta.org/cone/"
license=('GPL2')
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

sha256sums=('88a891e531ed12477b1b5ef0d9400d29261b494eb793eb5c7436a08c6351dbc0')

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
}

# EOF
