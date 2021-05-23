# Maintainer: Srevin Saju <srevinsaju@sugarlabs.org>

pkgname=sugar-datastore-git
pkgver=v0.118
pkgrel=1
pkgdesc="Sugar datastore service"
arch=('x86_64')
url="https://sugarlabs.org/"
license=('GPL')
depends=('python-dbus' 'python-gobject' 'python-xapian')
source=("git+https://github.com/sugarlabs/sugar-datastore.git")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/${pkgname%-git}"
  # d -i 's@^#!.*python$@#!/usr/bin/python2@' bin/copy-to-journal
}

build() {
  cd "$srcdir/${pkgname%-git}"
  chmod +x ./autogen.sh
  ./autogen.sh --prefix=/usr --with-python3
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir" install
}
