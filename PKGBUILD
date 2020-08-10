# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: birdflesh <antkoul at gmail dot com>
# Contributor: Natan Vivo <nvivo64_gmail_com>
# Contributor: rabyte <rabyte*gmail>
# Contributor: Simon Morgan <simon@16hz.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=fatsort-svn
pkgver=1.6.3.r623
pkgrel=1
pkgdesc='Sorts directory structures of FAT16 and FAT32 file systems'
arch=('x86_64')
url='http://fatsort.sourceforge.net'
license=('GPL')
depends=('glibc')
makedepends=('help2man')
conflicts=('fatsort')
provides=('fatsort')
source=("fatsort-svn::svn+https://svn.code.sf.net/p/fatsort/code/trunk")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}
  local _majorver=$(grep INFO_VERSION src/fatsort.c | cut -f3 | tr -d -- \")
  printf "%s.r%s" $(echo $_majorver) $(svnversion)
}

build() {
  cd ${pkgname}
  make
  cd man
  make
}

package() {
  cd ${pkgname}
  make DESTDIR="$pkgdir" SBINDIR=/usr/bin MANDIR=/usr/share/man/man1 install
}
