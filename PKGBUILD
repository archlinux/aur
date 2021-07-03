# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Michal Hybner <dta081@gmail.com>

pkgname=libosip2
epoch=1
pkgver=5.2.1
pkgrel=1
pkgdesc="an implementation of SIP"
arch=('x86_64' 'i686')
url="http://www.gnu.org/software/osip/"
license=('LGPL')
depends=(glibc)
options=(!emptydirs)
validpgpkeys=('34C3985D068879312FE23C8BB5902A3AD90A5421')
source=(https://ftp.gnu.org/gnu/osip/libosip2-${pkgver/_/-}.tar.gz)
sha256sums=('ee3784bc8e7774f56ecd0e2ca6e3e11d38b373435115baf1f1aa0ca0bfd02bf2')

build() {
  cd "$srcdir"/libosip2-${pkgver/_/-}/
  ./configure --prefix=/usr --disable-semaphore --enable-sysv
  # Fight unused direct deps
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' libtool
  make
}

package() {
  cd "$srcdir"/libosip2-${pkgver/_/-}/
  make DESTDIR="$pkgdir" install
}
