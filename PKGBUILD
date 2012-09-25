# $Id: PKGBUILD 75895 2012-09-05 04:42:55Z dreisner $
# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

_pkgbasename=util-linux
pkgname=libx32-$_pkgbasename
pkgver=2.22
pkgrel=1.1
pkgdesc="Miscellaneous system utilities for Linux (x32 ABI)"
url='http://www.kernel.org/pub/linux/utils/util-linux/'
arch=('x86_64')
depends=('libx32-glibc' "$_pkgbasename")
makedepends=('gcc-multilib-x32')
provides=('libx32-util-linux-ng')
conflicts=('libx32-util-linux-ng')
replaces=('libx32-util-linux-ng')
license=('GPL2')
options=('!libtool' '!emptydirs')
source=("ftp://ftp.kernel.org/pub/linux/utils/util-linux/v$pkgver/util-linux-$pkgver.tar.xz")
md5sums=('ba2d8cc12a937231c80a04f7f7149303')

shopt -s extglob

build() {
  cd "$_pkgbasename-$pkgver"

  export CC="gcc -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  ./configure --without-ncurses --libdir=/usr/libx32

  make lib{uuid,blkid,mount}.la
}

package() {
  make -C "$_pkgbasename-$pkgver" \
    DESTDIR="$pkgdir" \
    install-usrlib_execLTLIBRARIES \
    install-pkgconfigDATA
}
