# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: rtfreedman  <rob<d_t>til<d_t>freedman<a@T>g*a*l<d_t>com>

pkgname=exfat-utils-nofuse
pkgver=1.2.5
pkgrel=1
pkgdesc="Utilities for the exFAT file system without fuse (to prefer exfat kernel module over fuse)"
arch=('i686' 'x86_64')
url='https://github.com/relan/exfat'
license=('GPL2')
depends=('glibc')
provides=('exfat-utils')
conflicts=('fuse-exfat' 'exfat-utils' )
replaces=('exfat-utils')
source=(exfat-${pkgver}.tar.gz::https://github.com/relan/exfat/archive/v${pkgver}.tar.gz)
sha512sums=('37545ed3c89c17d16ae235592aaf48748c49b13b127a2cad3b6bc90632a5ecf00023393197a61bbaf7ad7715fa5d83a3b1cb8faa0d8cdc527919fa717b2ee9bf')

build() {
  cd exfat-${pkgver}
  
  # exclude fuse directory
  sed -i 's/fuse label mkfs/label mkfs/' Makefile.am
  
  autoreconf -i
  ./configure --prefix=/usr --sbindir=/usr/bin
  make CCFLAGS="${CFLAGS} -std=c99" LINKFLAGS="${LDFLAGS}"
}

package() {
  cd exfat-${pkgver}
  make DESTDIR="${pkgdir}" install
}
