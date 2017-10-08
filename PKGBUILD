# $Id$
# Maintainer: piernov <piernov@piernov.org>

pkgname=libuser-ldap
pkgver=0.62
pkgrel=1
pkgdesc='LDAP module for libuser'
arch=('i686' 'x86_64')
license=('LGPL')
url='https://pagure.io/libuser/'
depends=('libuser' 'libldap')
source=("https://releases.pagure.org/libuser/libuser-${pkgver}.tar.xz")
sha256sums=('a58ff4fabb01a25043b142185a33eeea961109dd60d4b40b6a9df4fa3cace20b')

build() {
  cd libuser-${pkgver}
  export PYTHON=python2
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --disable-gtk-doc-html \
    --disable-rpath \
    --with-ldap
  sed -i 's/SUBDIRS = po docs/SUBDIRS = po/' Makefile
  make
}

package() {
  cd libuser-${pkgver}
  install -m755 -D ./modules/.libs/libuser_ldap.so "${pkgdir}/usr/lib/libuser/libuser_ldap.so"
}
