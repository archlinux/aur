# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=gfs2-utils
pkgver=3.1.10
pkgrel=1
pkgdesc=""
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'MIT')
url="https://sourceware.org/cluster/gfs/"
depends=('libutil-linux' 'ncurses' 'gettext' 'bison' 'flex' 'zlib')
makedepends=('bc' 'util-linux' 'check')
source=("https://releases.pagure.org/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
options=('staticlibs')
sha512sums=('99e20045f1fedaceb1f59e7a78189701e9c787821ac4232800dd2d451f2924cb0930544fee274277c6da1ff1a7e2077186a36dacd2769b3583a818cc31bd2c82')

build() {
#  LDFLAGS="-Wl,-O1,--sort-common,-z,relro"
   LDFLAGS="${LDFLAGS//',--as-needed'}"
   echo $LDFLAGS
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
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
