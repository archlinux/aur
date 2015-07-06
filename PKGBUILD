# Maintainer: masutu <masutu dot arch at gmail dot com>
# Contributor: masutu <masutu dot arch at gmail dot com>
pkgname=vdt
pkgver=5.4.68
pkgrel=1
pkgdesc="Visual Disk Test performs i/o tests on files, logical volumes, partitions or whole disks."
arch=('i686' 'x86_64')
url="http://budtoolshed.sourceforge.net/"
license=('GPL')
depends=('ncurses')
source=(http://sourceforge.net/projects/budtoolshed/files/$pkgname-$pkgver-src.tar.gz)
md5sums=('93cd7d24b63ba70d7340a9befb1e6d5f')

build() {
  cd "$srcdir/${pkgname}5"

  ./configure
  make
}

package() {
  cd "$srcdir/${pkgname}5"

  install -D -m755 vdt $pkgdir/usr/bin/vdt
  install -D -m644 vdt.1 $pkgdir/usr/share/man/man1/vdt.1
  
  for file in AUTHORS ChangeLog NEWS README TODO;
  do
    install -D -m644 $file $pkgdir/usr/share/doc/$pkgname/$file;
  done
  
  for file in bigtest.sh deadtest.sh vdtest.sh;
  do
    sed -i 's/\.\/vdt/\/usr\/bin\/vdt/g' $file;
    install -D -m644 $file $pkgdir/usr/share/doc/$pkgname/examples/$file;
  done
}

# vim:set ts=2 sw=2 et:
