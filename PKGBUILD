# Maintainer: Runnytu < runnytu at gmail dot com >
# Old Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

pkgname=courier-maildrop
_srcname=maildrop
pkgver=3.1.8
pkgrel=1
pkgdesc="mail delivery agent - procmail like but nicer syntax"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://courier-mta.org/maildrop/"
depends=('courier-authlib>=0.71.0' 'gamin' 'pcre2' 'gdbm' 'courier-unicode>=2.1' 'libidn')
conflicts=('courier-mta')
options=('!libtool' '!staticlibs')
source=(https://downloads.sourceforge.net/project/courier/${_srcname}/${pkgver}/${_srcname}-${pkgver}.tar.bz2)
sha512sums=('0ee8e36cc5464cbbbef60721da19de7a12b9aa4737e40039c421ee14494c53f87146d50d1b8ae64186d8330121d54a62092435cadb51c3dede31658ff5104eb8')

build() {
  cd "${srcdir}/${_srcname}-${pkgver}"

  ./configure --prefix=/usr \
    --sysconfdir=/etc/courier \
    --localstatedir=/var \
    --mandir=/usr/share/man \
    --with-db=gdbm \
    --with-devel \
    --enable-dovecotauth
  make LDFLAGS+=-lstdc++
}

package() {
  cd "${srcdir}/${_srcname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  chmod u+s "${pkgdir}/usr/bin/maildrop"
}
