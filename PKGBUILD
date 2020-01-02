# Maintainer: Srevin Saju <srevin03@gmail.com>

pkgname=sugar3-datastore
pkgver=0.116
pkgrel=2
pkgdesc="Sugar datastore service"
arch=('x86_64')
url="https://sugarlabs.org/"
license=('GPL')
depends=('python-dbus' 'python-gobject' 'python-xapian')
source=("https://github.com/sugarlabs/sugar-datastore/archive/v$pkgver.tar.gz")
sha256sums=('effea81c46b1811f4fc59d7eccb9b3451277f9c1e4a4f1db9f6be41df34f41e2')

prepare() {
  cd sugar-datastore-$pkgver
  # d -i 's@^#!.*python$@#!/usr/bin/python2@' bin/copy-to-journal
}

build() {
  cd sugar-datastore-$pkgver
  chmod +x ./autogen.sh
  ./autogen.sh --prefix=/usr --with-python3
  make
}

package() {
  cd sugar-datastore-$pkgver
  make DESTDIR="$pkgdir" install
}
