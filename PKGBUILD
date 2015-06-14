# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: L.G. Sarmiento (Pico) <Luis.Sarmientop@nuclear.lu.se>
pkgname=top-c
_pkgname=topc
pkgver=2.5.2
pkgrel=1
pkgdesc="A Package for Easily Writing Parallel Applications for both Distributed and Shared Memory Architectures"
url="http://www.ccs.neu.edu/home/gene/topc.html"
arch=('i686' 'x86_64')
license=('LGPL')
source=(ftp://ftp.ccs.neu.edu/pub/people/gene/$_pkgname/$_pkgname.tar.gz)
md5sums=('d92435bcd977265d18bd1845758645ee')
build() {
  cd $srcdir/$_pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd $srcdir/$_pkgname-$pkgver

  msg "Tweaking the Makefile for installation"
  sed -i 's#prefix=/usr#prefix=${DESTDIR}/usr#g' Makefile
  sed -i "/&&/d" Makefile
  sed -i "/install-info/d" Makefile
  make DESTDIR=$pkgdir install
}
