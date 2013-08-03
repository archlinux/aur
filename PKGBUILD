# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: Eric Le Bras <eric.lebras@gmail.com>
# Contributor: Uwe Koloska <kolewu@koloro.de>

pkgname=mma
pkgver=12.10
pkgrel=1
pkgdesc="Musical MIDI Accompaniment (MMA) is an accompaniment generator"
url="http://www.mellowood.ca/mma/"
depends=('python2>=2.5.0' 'timidity++')
license=('GPL')
arch=('any')
install=mma.install
DLAGENTS=('http::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 --user-agent "Mozilla/4.0" -o %o %u ')
source=("http://www.mellowood.ca/mma/mma-bin-$pkgver.tar.gz"
  mmarc)
md5sums=('1c34126c092ca07aab1b606c73670a64'
         '7cdddd5de515539cf66f0d8d9613dcdc')

build () {

  cd $srcdir/$pkgname-bin-$pkgver
  for file in $(grep -rl 'env python *$' .); do sed -i 's/env python *$/env python2/g' $file ;done
}

package () {
  cd $srcdir/$pkgname-bin-$pkgver

  mkdir -p $pkgdir/usr/{bin,share/mma,share/man/man1,share/man/man8}
  mkdir -p $pkgdir/etc


  cp mma.py $pkgdir/usr/bin/mma
  cp mma-gb $pkgdir/usr/bin/mma-gb
  cp mma-libdoc $pkgdir/usr/bin/mma-libdoc
  cp mma-renum $pkgdir/usr/bin/mma-renum
  cp util/mma-mnx.py $pkgdir/usr/bin/mma-mnx
  cp util/mma-rm2std.py $pkgdir/usr/bin/mma-rm2std
  cp util/mma-splitrec.py $pkgdir/usr/bin/mma-splitrec
  cp util/mmatabs.py $pkgdir/usr/bin/mmatabs
  cp util/mup2mma.py $pkgdir/usr/bin/mup2mma
  cp util/pg2mma.py $pkgdir/usr/bin/pg2mma
  cp util/synthsplit.py $pkgdir/usr/bin/mma-synthsplit
  cp -r {docs,egs,includes,lib,MMA,text} $pkgdir/usr/share/mma
  cp util/README.* $pkgdir/usr/share/mma/docs
  mv $pkgdir/usr/share/mma/docs/man/mma-libdoc.8 $pkgdir/usr/share/man/man8
  mv $pkgdir/usr/share/mma/docs/man/mma-renum.1 $pkgdir/usr/share/man/man1
  mv $pkgdir/usr/share/mma/docs/man/mma.1 $pkgdir/usr/share/man/man1
  rm -rf $pkgdir/usr/share/mma/docs/man
  cp $srcdir/mmarc $pkgdir/etc

}
