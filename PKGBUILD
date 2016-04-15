# $Id$
# Maintainer: piernov <piernov@piernov.org>

pkgname=libuser-ldap
pkgver=0.62
pkgrel=1
pkgdesc='LDAP module for libuser'
arch=('i686' 'x86_64')
license=('LGPL')
url='https://fedorahosted.org/libuser/'
depends=('libuser' 'libldap')
source=("https://fedorahosted.org/releases/l/i/libuser/libuser-${pkgver}.tar.xz")
md5sums=('63e5e5c551e99dc5302b40b80bd6d4f2')

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
