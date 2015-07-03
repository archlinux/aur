# Maintainer: Audric Schiltknecht <storm+arch@chemicalstorm.org>

pkgname=rohc
pkgver=1.7.0
pkgrel=1
pkgdesc="RObust Header Compression (ROHC) library"
arch=('i686' 'x86_64')
depends=('glibc')
makedepends=('libpcap')
options=('!libtool')
url="http://rohc-lib.org/"
license=('LGPL')
source=("https://launchpad.net/rohc/rohc-1.7.x/${pkgver}/+download/${pkgname}-${pkgver}.tar.xz")
md5sums=('a7b376fdc75be41f3f1cba91a9a57046')

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
