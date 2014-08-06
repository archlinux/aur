# Maintainer:
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>

pkgname=libgadu
pkgver=1.12.0
pkgrel=2
pkgdesc="This library implements the client side of the Gadu-Gadu protocol"
arch=('i686' 'x86_64')
url="http://libgadu.net/"
license=('LGPL2.1')
depends=('gnutls' 'protobuf-c')
source=("http://github.com/wojtekka/libgadu/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'protobuf-c.patch')
md5sums=('e4569a0ed26136c4634fa8c4013910e3'
         '0139f15f89db5a3684994ae5ba4115d9')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p1 -i "${srcdir}"/protobuf-c.patch
}

build() {
  cd ${pkgname}-${pkgver}
  ./protobufgen.sh
  ./configure --prefix=/usr \
    --disable-tests \
    --disable-static
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
