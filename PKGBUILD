# $Id$
# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=mate-menu
pkgver=5.6.6
pkgrel=1
pkgdesc="Advanced menu for MATE Panel, a fork of MintMenu"
arch=('any')
url="https://bitbucket.org/ubuntu-mate/mate-menu"
license=('GPL')
depends=('mate-panel' 'python2-configobj' 'python2-gobject' 'python2-pyinotify' 'python2-xdg' 'python2-xlib' 'xdg-utils')
makedepends=('git' 'python2-distutils-extra' 'python2-setuptools')
install=$pkgname.install
source=("$pkgname-$pkgver::git+https://bitbucket.org/ubuntu-mate/$pkgname.git#tag=$pkgver"
        fix-crash.patch
        optional-lsb_release.patch)
md5sums=('SKIP'
         '4c48e1b70b8b17257cacb0755ca23595'
         'ba78ee5386cab68e55a3f0f5ca0c53f6')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../fix-crash.patch
  patch -Np1 -i ../optional-lsb_release.patch
  sed -i 's@^#!.*python$@#!/usr/bin/python2@' lib/*.py
}

package() {
  cd $pkgname-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
}
