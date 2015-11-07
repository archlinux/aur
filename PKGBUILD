# $Id$
# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=mate-menu
pkgver=5.6.5a
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
        fix-desktop-path.patch
        optional-lsb_release.patch)
md5sums=('SKIP'
         '6b6623895d02b739d0d6fb4413f0b6ba'
         '3aeb919106f0f6476b234e4ce6990a06'
         '92c321a71c6f5ae61695d61eb5f89b50')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../fix-crash.patch
  patch -Np1 -i ../fix-desktop-path.patch
  patch -Np1 -i ../optional-lsb_release.patch
  sed -i 's@^#!.*python$@#!/usr/bin/python2@' lib/*.py
}

package() {
  cd $pkgname-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
}
