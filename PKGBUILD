# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=gfs2-utils
pkgver=3.1.8
pkgrel=1
pkgdesc=""
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'MIT')
url="https://sourceware.org/cluster/gfs/"
depends=('libutil-linux' 'ncurses' 'gettext' 'bison' 'flex' 'zlib')
makedepends=('bc' 'util-linux' 'check')
source=("https://git.fedorahosted.org/cgit/gfs2-utils.git/snapshot/${pkgname}-${pkgver}.tar.gz")
options=('staticlibs')
sha512sums=('6d38a4f48162d2ae90a923052df313e00f1f2ba815fa59b640ddceafb0d5452397caeb04a41f1e5d845bfbd9cbd26c29715ea865d13de2f61fd23a3d451c06d7')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
   ./autogen.sh
   ./configure --prefix=/usr --with-root-prefix="" --libdir=/usr/lib \
       --sbindir=/usr/bin --enable-elf-shlibs --disable-fsck --disable-uuidd \
       --disable-libuuid --disable-libblkid
  make
}


# check() {
#   cd "${srcdir}/${pkgname}-${pkgver}"
#   make check
# }


package() {
  unset MAKEFLAGS

  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
