# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=libuser-ldap
pkgver=0.63
pkgrel=1
pkgdesc='LDAP module for libuser'
arch=('i686' 'x86_64')
license=('LGPL')
url='https://pagure.io/libuser/'
depends=('libuser' 'libldap')
makedepends=('autoconf' 'automake' 'gettext' 'gtk-doc' 'libtool')
source=("https://releases.pagure.org/libuser/libuser-${pkgver}.tar.xz")
sha256sums=('8dc377255452a68e82c4837ba22c3ee4ae3658971bf0f2ef67ed0b77fc497f91')

build() {
  cd libuser-${pkgver}
  ./autogen.sh
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
