# Maintainer:
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=keepnote
pkgver=0.7.8
pkgrel=4
pkgdesc="GTK+ note taking application"
arch=('any')
url="http://keepnote.org/"
license=('GPL')
depends=('pygtk')
optdepends=('python2-gtkspell: spell shecking support')
source=(http://keepnote.org/download/$pkgname-$pkgver.tar.gz)
md5sums=('c1e765bb8a07630f717d04117bc1dc58')

prepare() {
  cd $pkgname-$pkgver

  # Python2 fix
  sed -i 's|^#!/usr/bin/env python$|#!/usr/bin/env python2|' keepnote/tarfile.py

  # Fix l10n support
  rename '.UTF8' '' keepnote/rc/locale/*
}

build() {
  cd $pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $pkgname-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
}
