# Maintainer: Runnytu < runnytu at gmail dot com >
# Old Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

pkgname=courier-maildrop
_srcname=maildrop
pkgver=3.1.7
pkgrel=1
pkgdesc="mail delivery agent - procmail like but nicer syntax"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://courier-mta.org/maildrop/"
depends=('courier-authlib>=0.71.0' 'gamin' 'pcre2' 'gdbm' 'courier-unicode>=2.1' 'libidn')
conflicts=('courier-mta')
options=('!libtool' '!staticlibs')
source=(https://downloads.sourceforge.net/project/courier/${_srcname}/${pkgver}/${_srcname}-${pkgver}.tar.bz2)
sha512sums=('972f3891d6f1daca97971d6cc3e09e4f78ce7bf8bb4520ed2836b8d7d9394546d403a0dd709e6b2e34706f67aae2563523bbc0953a9971cc2107fc0838fa095e')

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
