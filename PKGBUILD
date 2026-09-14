# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Michal Hybner <dta081@gmail.com>

pkgname=libosip2
pkgver=5.3.1
pkgrel=1
pkgdesc="An implementation of SIP"
arch=('x86_64' 'i686' 'aarch64')
url="https://www.gnu.org/software/osip"
license=('LGPL')
depends=(glibc)
options=(!emptydirs)
source=("https://ftp.gnu.org/gnu/osip/libosip2-${pkgver}.tar.gz"{,.sig})
sha256sums=('fe82fe841608266ac15a5c1118216da00c554d5006e2875a8ac3752b1e6adc79' 'SKIP')
validpgpkeys=('34C3985D068879312FE23C8BB5902A3AD90A5421')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --disable-semaphore
  # Fight unused direct deps
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' libtool
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
