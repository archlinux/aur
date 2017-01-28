# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: rtfreedman  <rob<d_t>til<d_t>freedman<a@T>g*a*l<d_t>com>

pkgname=exfat-utils-nofuse
pkgver=1.2.6
pkgrel=1
pkgdesc='Utilities for the exFAT file system without fuse (to prefer exfat kernel module over fuse)'
arch=('i686' 'x86_64')
url='https://github.com/relan/exfat'
license=('GPL2')
depends=('glibc')
provides=('exfat-utils')
conflicts=('fuse-exfat' 'exfat-utils' )
replaces=('exfat-utils')
source=(exfat-${pkgver}.tar.gz::https://github.com/relan/exfat/archive/v${pkgver}.tar.gz)
sha512sums=('76f9ece1ea0d449c48ae71d367021ed7cee05b1619239954b725adbe68c33b76046a8620c64dbebdcc69f2ca32abd242e12f4d592a00cd7fdd2277ff6803fc96')

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
