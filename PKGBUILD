# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=libuser
pkgver=0.62
pkgrel=3
pkgdesc='A standardized interface for manipulating and administering user and group accounts.'
arch=('x86_64')
license=('LGPL')
url='https://pagure.io/libuser/'
depends=('python' 'glib2' 'popt')
backup=('etc/libuser.conf')
source=("https://releases.pagure.org/libuser/libuser-${pkgver}.tar.xz")
sha256sums=('a58ff4fabb01a25043b142185a33eeea961109dd60d4b40b6a9df4fa3cace20b')

build() {
  cd ${pkgname}-${pkgver}
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
