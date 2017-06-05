# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: rtfreedman  <rob<d_t>til<d_t>freedman<a@T>g*a*l<d_t>com>

pkgname=exfat-utils-nofuse
pkgver=1.2.7
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
sha512sums=('f90b1eff5c51ff93377f82f2838d214e0670a4a8c54fb7c0ec8ce743971b35867975568b8886e8fae8e320706419cf4e39d0852e68350c9b999cf0be4c5f88fc')

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
