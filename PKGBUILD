#
# PKGBUILD for cone-simple
#
# cone-simple is an stripped package build of cone
#
# This version has no dependencies to other courier libraries (other than the minimal courier-unicode).
#
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
#
#

pkgname=cone-simple
pkgver=2.4
pkgrel=1
epoch=
pkgdesc="Curses text-based mail client - inspired by Alpine - handles multiple POP3, IMAP accounts, and local mail folders. contains a simple newsreader. This version has no dependencies to courier libraries (other than the mandatory courier-unicode)."
arch=('i686' 'x86_64')
_pkgname=cone
url="http://courier-mta.org/cone/"
license=('GPL-3.0-only')
#groups=()
makedepends=('procps-ng')
depends=('glibc' 'libgcc' 'libstdc++' 'libxml2' 'libidn2' 'libldap' 'courier-unicode' 'ncurses' 'openssl')
checkdepends=()
#optdepends=()
provides=('cone')
#conflicts=()
#replaces=()
#backup=()
#options=()
#install=
#changelog=

source=(https://sourceforge.net/projects/courier/files/cone/${pkgver}/cone-${pkgver}.tar.bz2
        #https://sourceforge.net/projects/courier/files/cone/${pkgver}/cone-${pkgver}.tar.bz2.sig
)

#noextract=()

sha256sums=("61a1eff978f43d242047c0bb63bbb69d4a8569e5207b2feb86ef8f7aed3469d0"
            #"SKIP"
)

#
#
#

prepare()
{
  cd "${srcdir}/${_pkgname}-${pkgver}"
}

build()
{
  cd "${srcdir}/${_pkgname}-${pkgver}";
  ./configure -C --without-db --with-certdb=/usr/share/cone/rootcerts --prefix=/usr --exec-prefix=/usr --libexecdir=/usr/lib/cone --sysconfdir=/etc --with-notice=unicode;
  # Add C++17 workaround (https://sourceforge.net/p/courier/mailman/message/59348126/)
  #./configure -C --without-db --with-certdb=/usr/share/cone/rootcerts --prefix=/usr --exec-prefix=/usr --libexecdir=/usr/lib/cone --sysconfdir=/etc --with-notice=unicode CXXFLAGS=--std=gnu++17;
  make;
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
