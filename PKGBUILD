# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=gtools
pkgver=0.1.0
pkgrel=2
pkgdesc="Tool to read 2MGUI disks in Linux"
arch=('x86_64')
url="http://www.manty.net/www.geocities.com/SiliconValley/Lakes/1486/smanty.html"
license=('GPL')
depends=('glibc')
source=('http://www.manty.net/www.geocities.com/SiliconValley/Lakes/1486/gtools-0_1_0.tgz'
        'errno.patch')

prepare() {
  patch -p1 -i errno.patch
}

build() {
  # the tarball ships prebuilt binaries; build ours with the makepkg flags
  gcc $CPPFLAGS $CFLAGS $LDFLAGS gtools.c -o gtools
}

package() {
  install -Dm755 $srcdir/gtools $pkgdir/usr/bin/gtools
  for f in gcopy gdir gimage gtype
  do
    ln -sf gtools "$pkgdir/usr/bin/$f"
  done
  install -Dm644 $srcdir/COPYING $pkgdir/usr/share/licenses/gtools/COPYING
  install -Dm644 $srcdir/README $pkgdir/usr/share/doc/gtools/README
}
md5sums=('33c7806b35a99fb9dd95738f2017de83'
         '08e63059ab7b467345c6fe1fd4e0e3b1')
