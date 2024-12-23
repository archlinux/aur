# Maintainer: Vincent Bernardoff <vb AT luminar.eu.org>

pkgname=libkcapi
pkgver=1.5.0
pkgrel=1
pkgdesc="Linux Kernel Crypto API User Space Interface Library"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="http://www.chronox.de/libkcapi.html"
makedepends=('autoconf' 'automake' 'm4' 'make' 'pkg-config')
license=('BSD' 'GPL2')
source=("https://github.com/smuellerDD/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f1d827738bda03065afd03315479b058f43493ab6e896821b947f391aa566ba0')

build() {
  cd "${pkgname}-${pkgver}"
  autoreconf -i
  ./configure \
      --prefix=/usr \
      --enable-kcapi-test \
      --enable-kcapi-speed \
      --enable-kcapi-hasher \
      --enable-kcapi-rngapp \
      --enable-kcapi-encapp \
      --enable-kcapi-dgstapp \
      --enable-lib-asym \
      --enable-lib-kpp
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  for file in COPYING* ; do
      install -Dm 644 $file -t "$pkgdir/usr/share/licenses/$pkgname"
  done
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  make DESTDIR="$pkgdir" install
}
