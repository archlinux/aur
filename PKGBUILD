# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=boron
pkgver=0.2.10
pkgrel=1
pkgdesc="An interpreted, prototype-based, scripting language similar to Rebol."
arch=('i686' 'x86_64')
url="http://urlan.sourceforge.net/boron/"
license=('LGPL3')
groups=('lib')
makedepends=('zlib')
options=('!makeflags')
source=("http://osdn.dl.sourceforge.net/project/urlan/Boron/$pkgname-$pkgver.tar.gz")
md5sums=('42b1be7ee448e0abb36388f63cb25ffd')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/{bin,lib,include/boron}
  install -m755 boron $pkgdir/usr/bin/
  sed -e 's~"urlan.h"~<boron/urlan.h>~' include/boron.h >boron.x
  install -Tm644 boron.x $pkgdir/usr/include/boron/boron.h
  install -m644 -t $pkgdir/usr/include/boron include/{boron,urlan{,_atoms},bignum}.h
  install -m755 -t $pkgdir/usr/lib libboron.so.$pkgver
  cd $pkgdir/usr/lib
  ln -sf libboron.so.$pkgver libboron.so
  ln -sf libboron.so.$pkgver libboron.so.0  
}
