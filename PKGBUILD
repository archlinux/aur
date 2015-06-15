#! /bin/bash
# Maintainer: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: lssjbrolli <lssjbrolli@gmail.com>
pkgname=aircrack-m4-svn
pkgver=r18
pkgrel=2
pkgdesc="A GUI for aircrack-ng written  in C++ an Qt."
arch=('i686' 'x86_64')
url="http://code.google.com/p/aircrackgui-m4/"
license=('GPL')
depends=('qt4' 'aircrack-ng' 'macchanger')
makedepends=('subversion')
provides=(aircrack-m4)
source=("svn+http://aircrackgui-m4.googlecode.com/svn/trunk/")
sha512sums=('SKIP')

_svnmod=trunk

pkgver() {
  cd trunk/
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"


  qmake-qt4
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  mkdir -p $pkgdir/usr/bin/
  cp aircrack-GUI $pkgdir/usr/bin/aircrackgui-m4
}

