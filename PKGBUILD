# Maintainer: Runnytu < runnytu at gmail dot com >
# Maintainer:  Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Marcel Wysocki <maci@satgnu.net>
# Contributor: Marek Skrobacki <skrobul@skrobul.com>

pkgname=dynagen
pkgver=0.11.0
pkgrel=6
pkgdesc="Dynagen is a front-end for use with the Dynamips Cisco router emulator."
arch=('i686' 'x86_64')
url="http://www.dynagen.org"
license=('GPL')
depends=('dynamips' 'python2' 'inetutils' 'elfutils')
source=(http://downloads.sourceforge.net/dyna-gen/${pkgname}-${pkgver}.tar.gz)
md5sums=('3f88b3449b17096dca84d007f0b91b3f')

build() {
  cd $srcdir/$pkgname-$pkgver
  sed -i 's/\/usr\/bin\/python/\/usr\/bin\/python2/' *.py dynagen
  sed -i 's/\/usr\/bin\/env python/\/usr\/bin\/python2/' *.py
  rm -R docs/ sample_labs/ COPYING README.txt
}

package() {
  mkdir -p $pkgdir/usr/share/dynagen
  cp -dpr --no-preserve=ownership $srcdir/$pkgname-$pkgver/* $pkgdir/usr/share/dynagen

  mkdir -p $pkgdir/usr/bin
  cd $pkgdir/usr/bin
  ln -s ../share/dynagen/dynagen

  mkdir $pkgdir/etc
  mv $pkgdir/usr/share/dynagen/dynagen.ini $pkgdir/etc
  chmod 644 $pkgdir/usr/share/dynagen/*
  chmod 755 $pkgdir/usr/share/dynagen/dynagen
  chmod 755 $pkgdir/usr/share/dynagen/pemu-start.sh
}
