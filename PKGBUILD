# Maintainer:
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>

pkgname=libgadu
pkgver=1.12.2
pkgrel=8
pkgdesc="This library implements the client side of the Gadu-Gadu protocol"
arch=('x86_64')
url="http://libgadu.net/"
license=('LGPL2.1')
depends=('gnutls' 'protobuf-c')
source=($pkgname-$pkgver.tar.gz::"https://github.com/wojtekka/libgadu/archive/$pkgver.tar.gz")
md5sums=('1eecae8245d696adfbcfd40a2b36f0ca')

build() {
  cd "${pkgname}-${pkgver}"

  ./autogen.sh
  ./protobufgen.sh
  ./configure --prefix=/usr --disable-tests --disable-static
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
