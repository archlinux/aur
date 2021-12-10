# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Sebastian 'Swift Geek' Grzywna <swiftgeek@gmail.com>
pkgname=altermime
pkgver=0.3.11
pkgrel=0
pkgdesc="MIME encoded email pack alteration tool"
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url="https://pldaniels.com/${pkgname}"
license=('custom')
source=("${url}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('9e5082abc72a0f0d77ee947c61c654ff7f90151b7d7a7e36819e85420dbd9e7cfdb4d053cebcbfd629380aab3d9998ed802a59212ac5c433d50e006b1558dc5f')

prepare() {
  sed -i 's/^CFLAGS=-Wall -Werror -g -I. -O2 $(ALTERMIME_OPTIONS)/CFLAGS=-Wall $(ALTERMIME_OPTIONS)/' "${pkgname}-${pkgver}/Makefile"
  sed -i 's/^	${CC} ${CFLAGS} altermime.c ${OBJS} -o altermime/	${CC} ${CFLAGS} ${LDFLAGS} altermime.c ${OBJS} -o altermime/' "${pkgname}-${pkgver}/Makefile"
}

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -d "${pkgdir}/usr/bin/"
  install -m 755 ${pkgname} "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}"
}
