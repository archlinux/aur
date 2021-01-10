# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=libnbd
pkgver=1.6.0
pkgrel=1
pkgdesc="NBD client library in userspace"
arch=('i686' 'x86_64')
url="https://github.com/libguestfs/libnbd"
license=('LGPL2.1')
depends=()
makedepends=('perl')
validpgpkeys=('F7774FB1AD074A7E8C8767EA91738F73E1B768A0')
source=(
		"http://download.libguestfs.org/libnbd/1.6-stable/libnbd-${pkgver}.tar.gz"
		"http://download.libguestfs.org/libnbd/1.6-stable/libnbd-${pkgver}.tar.gz.sig"
)


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  autoreconf -i
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i /pycodestyle.sh/d python/Makefile
  rm python/pycodestyle.sh
  make check
}

sha256sums=('81b77d18a069db7f7a4ae667a3279f6659da31e099f358cf8745668e2409b67f'
            'SKIP')
