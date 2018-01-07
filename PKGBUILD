# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Thomas Dziedzic < gostrc at gmail >

pkgname=libuser
pkgver=0.62
pkgrel=2
pkgdesc='A standardized interface for manipulating and administering user and group accounts.'
arch=('x86_64')
license=('LGPL')
url='https://pagure.io/libuser/'
depends=('python2' 'glib2' 'popt')
backup=('etc/libuser.conf')
source=("https://releases.pagure.org/libuser/libuser-${pkgver}.tar.xz")
sha256sums=('a58ff4fabb01a25043b142185a33eeea961109dd60d4b40b6a9df4fa3cace20b')

build() {
  cd ${pkgname}-${pkgver}
  export PYTHON=python2
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
