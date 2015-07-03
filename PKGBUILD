# $Id$
# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=zeitgeist-explorer
pkgver=0.2
pkgrel=2
pkgdesc="Graphical interface to monitor and inspect Zeitgeist's log at a low level"
arch=('any')
url="https://launchpad.net/zeitgeist-explorer"
license=('LGPL')
depends=('gtk3' 'python2-gobject' 'zeitgeist')
makedepends=('python2-distutils-extra')
install=$pkgname.install
source=(https://launchpad.net/$pkgname/0.x/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('8521b2c8ecc3f0d425e6806dcb2fde59')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's@^#!.*python$@#!/usr/bin/python2@' zgexplorer/*.py
}

build() {
  cd $pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $pkgname-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
  rm -r "$pkgdir/usr/data"
}
