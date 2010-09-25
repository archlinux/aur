# Maintainer: Ray Rashif <schiv@archlinux.org>
# Contributor: Max Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: clarence <catchfire at gmail dot com>

pkgname=patchage
pkgver=0.4.5
pkgrel=2
pkgdesc="A modular patch bay for audio and MIDI systems"
arch=(i686 x86_64)
url="http://drobilla.net/software/patchage"
license=('GPL')
depends=('dbus-glib' 'libglademm' 'hicolor-icon-theme'
         'raul' 'flowcanvas' 'jack')
makedepends=('boost' 'python2')
install=$pkgname.install
source=(http://download.drobilla.net/$pkgname-$pkgver.tar.bz2)
md5sums=('77b92342db348e8edd5cc157c135d193')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # fix for python 2.7
  sed -i 's:^#!.*bin/env python:#!/usr/bin/env python2:' waf

  ./waf configure --prefix=/usr
  ./waf build $MAKEFLAGS
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  ./waf --destdir="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
