# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: rtfreedman  <rob<d_t>til<d_t>freedman<a@T>g*a*l<d_t>com>

pkgname=exfat-utils-nofuse
pkgver=1.2.8
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
sha512sums=('2805d8a59c53db348265943bfd5537aa1dfc87582fb1a3e9cba6ab112b93632be3c0932f72b57c7839d60faf1d455f56fd7d7a7f49e3e9419f4b6715332e939a')

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
