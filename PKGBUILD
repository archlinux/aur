# Maintainer: Colin Woodbury <colin@fosskers.ca>
# Contributor:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Kovivchak Evgen <oneonfire@gmail.com>

pkgname=jemalloc4
pkgver=4.5.0
pkgrel=1
pkgdesc='General-purpose scalable concurrent malloc implementation - 4.x series'
arch=('x86_64')
license=('BSD')
url='http://www.canonware.com/jemalloc/'
depends=('glibc')
provides=('libjemalloc.so' 'jemalloc')
conflicts=('jemalloc')
optdepends=('perl: for jeprof')
source=("https://github.com/jemalloc/jemalloc/releases/download/${pkgver}/jemalloc-${pkgver}.tar.bz2")
sha256sums=('9409d85664b4f135b77518b0b118c549009dc10f6cba14557d170476611f6780')

build() {
  cd jemalloc-$pkgver

  ./configure \
    --enable-autogen \
    --prefix=/usr
  make
}

package() {
  cd jemalloc-$pkgver

  make DESTDIR="$pkgdir" install

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/jemalloc/COPYING"
  chmod 644 "$pkgdir/usr/lib/libjemalloc_pic.a"
}
