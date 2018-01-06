# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Roland Schaeuble <rschaeuble@gmx.ch>

pkgname=cdcover
pkgver=0.7.4
pkgrel=6
pkgdesc="cdcover allows the creation of inlay-sheets for cd-cases and dvd's"
arch=('x86_64')
url="http://cdcover.sourceforge.net"
license=('GPL')
depends=('python2' 'tk')
install='cdcover.install'
source=("http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('ab54e927e1c2f9210062ae9425cea669')

build() {
  cd "$srcdir"/$pkgname

  # python2 fix
  sed -i 's_#!/usr/bin/python_#!/usr/bin/python2_' src/cdcover.py

  patch -p0 Makefile <<EOF
13c13
< IMAGEFILES=autonum.gif cddb.gif exit.gif gv.gif logo.gif nocddb.gif ps.gif
---
> IMAGEFILES=application-exit.gif cddb.gif document-print-preview.gif document-save.gif logo.gif nocddb.gif renumber.gif
EOF
}

package() {
  cd "$srcdir"/$pkgname
  make target=/usr prefix="$pkgdir"/usr install
  rm -rf "$pkgdir"/usr/doc
}
