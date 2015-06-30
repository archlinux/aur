# Maintainer: Jasper Follas follasjj@live.co.uk

pkgname=cleanwad
pkgver=1.54
pkgrel=3
arch=('i686' 'x86_64')
pkgdesc="An utility to clean Doom/Heretic/Hexen/Strife WAD files and sort directory entries by type"
url="http://www.martinhowe.net/gaming/downloads.php"
license=('custom')
depends=('unzip')
source=(http://www.martinhowe.net/gaming/public/${pkgname}.zip \
	LICENSE \
	Makefile.diff)
md5sums=('a184a41c009c6f0c0ed16bbbba031069'
         '50c924b20833a66b45a9fbf01049473d'
         '51c57127c9fb8437a79ce3e500199daa')

build() {
  cd $srcdir
  unzip -o sources.zip
  cd linux
  patch -Np0 -i $srcdir/Makefile.diff || return 1
  make || return 1
}

package () {
  install -m755 -D $srcdir/linux/cleanwad.exe $pkgdir/usr/bin/cleanwad
  install -m644 -D $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
