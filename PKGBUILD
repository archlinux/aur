# Maintainer: Srevin Saju <srevin03@gmail.com>

pkgname=sugar-datastore-git
pkgver=0.116.g
pkgrel=5
pkgdesc="Sugar datastore service"
arch=('x86_64')
url="https://sugarlabs.org/"
license=('GPL')
depends=('python-dbus' 'python-gobject' 'python-xapian')
source=("git+https://github.com/sugarlabs/sugar-datastore.git")
sha256sums=('SKIP')

prepare() {
  cd $pkgname-$pkgver
  # d -i 's@^#!.*python$@#!/usr/bin/python2@' bin/copy-to-journal
}

build() {
  cd $pkgname-$pkgver
  chmod +x ./autogen.sh
  ./autogen.sh --prefix=/usr --with-python3
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
