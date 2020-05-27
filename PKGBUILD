# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>

pkgname=libgadu
pkgver=1.12.2
pkgrel=13
pkgdesc="Client-side library for the Gadu-Gadu protocol"
arch=('x86_64')
url="https://libgadu.net/"
license=('LGPL2.1')
depends=('gnutls' 'protobuf-c')
source=($pkgname-$pkgver.tar.gz::https://github.com/wojtekka/libgadu/archive/$pkgver.tar.gz
        gcc10.patch)
sha256sums=('f53e703d7ad93ce222dbf7fc0cec77f62813af38817a3678e799e91f1c69c94d'
            '2dae59d29aa2eb0905cc3c220041d5cfd95183276d684f36c9dc955c24080382')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../gcc10.patch
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --disable-static
  make
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
