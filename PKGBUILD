# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=libuser
pkgver=0.63
pkgrel=1
pkgdesc='A standardized interface for manipulating and administering user and group accounts.'
arch=('x86_64')
license=('LGPL')
url='https://pagure.io/libuser/'
depends=('glib2' 'pam' 'popt' 'python')
makedepends=('autoconf' 'automake' 'gettext' 'libtool')
backup=('etc/libuser.conf')
source=("https://releases.pagure.org/libuser/libuser-${pkgver}.tar.xz")
sha256sums=('8dc377255452a68e82c4837ba22c3ee4ae3658971bf0f2ef67ed0b77fc497f91')

prepare() {
  cd ${pkgname}-${pkgver}
  # skip gtk docs
  sed -i 's/gtkdocize/# gtkdocize/' autogen.sh
}

build() {
  cd ${pkgname}-${pkgver}
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --disable-gtk-doc-html \
    --disable-rpath
  sed -i 's/SUBDIRS = po docs/SUBDIRS = po/' Makefile
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
}
