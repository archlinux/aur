# Maintainer: Audric Schiltknecht <storm+arch@chemicalstorm.org>

pkgname=rohc
pkgver=1.7.0
pkgrel=2
pkgdesc="RObust Header Compression (ROHC) library"
arch=('i686' 'x86_64')
depends=('glibc')
makedepends=('libpcap' 'cmocka')
options=('!libtool')
url="http://rohc-lib.org/"
license=('LGPL')
source=("https://rohc-lib.org/download/rohc-1.7.x/1.7.0/rohc-1.7.0.tar.xz")
sha256sums=("0f42adf9f29235bd9965c27ebaedf7517eb852a87e067d6cb39e8c0f92ed7e36")

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --enable-rohc-debug=no \
              --disable-static \
              --enable-rohc-tests
  make
}

check() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make -k check
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
