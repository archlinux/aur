# $Id: PKGBUILD 78820 2012-10-25 06:47:28Z foutrelis $
# Upstream Maintainer: Dave Reisner <dreisner@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>
# Maintainer: Fantix King <fantix.king at gmail.com>

_pkgbasename=util-linux
pkgname=libx32-$_pkgbasename
pkgver=2.22.1
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
source=("ftp://ftp.kernel.org/pub/linux/utils/util-linux/v2.22/util-linux-$pkgver.tar.xz")
md5sums=('730cf9932531ed09b53a04ca30fcb4c9')

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
