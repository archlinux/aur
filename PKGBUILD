# $Id: PKGBUILD,v 1.3 2009/02/09 00:33:30 angvp Exp $
# Maintainer: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve> 
# Contributor: Francis Carroll (franciscarroll at gmail dot com)
pkgname=splix 
pkgver=2.0.0
pkgrel=1
pkgdesc="CUPS drivers for SPL (Samsung Printer Language) printers" 
arch=('i686' 'x86_64')
url="http://splix.ap2c.org/" 
license=('GPL') 
depends=('libcups' 'gcc') 
makedepends=('cupsddk' 'libcups' 'jbigkit')
source=(http://downloads.sourceforge.net/splix/$pkgname-$pkgver.tar.bz2) 
md5sums=('f3aa735c22a926818b3d8b26c9964186')
build() { 
	  cd $srcdir/$pkgname-$pkgver
	  make || return 1 
	  install -d $pkgdir/usr/lib/cups/filter 
	  install -d $pkgdir/usr/share/cups/model/samsung 
	  make CUPSFILTER=$pkgdir/`cups-config --serverbin`/filter \
	  	CUPSPPD=$pkgdir/`cups-config --datadir`/model \
		install || return 1
}

