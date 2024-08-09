# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Sebastian 'Swift Geek' Grzywna <swiftgeek@gmail.com>
_base=alterMIME
pkgname=${_base,,}
pkgver=0.3.12
pkgrel=1
pkgdesc="MIME encoded email pack alteration tool"
arch=(i686 x86_64 armv7h armv6h)
url="https://pldaniels.com/${pkgname}"
license=(BSD-2-Clause)
source=(${_base}-${pkgver}.tar.gz::https://github.com/inflex/${_base}/archive/${pkgver}.tar.gz)
sha512sums=('72a2dfef5489d1e798e121308b03d272b2e679e15d3a45f3d25f9e27f9f6211a68ad032f33082a4bc38960f0a407b6892ec41e7fbd2073e950763da3942a7346')

prepare() {
  sed -i 's/^CFLAGS=-Wall -Werror -g -I. -O2 $(ALTERMIME_OPTIONS)/CFLAGS=-Wall $(ALTERMIME_OPTIONS)/' "${_base}-${pkgver}/Makefile"
  sed -i 's/^	${CC} ${CFLAGS} altermime.c ${OBJS} -o altermime/	${CC} ${CFLAGS} ${LDFLAGS} altermime.c ${OBJS} -o altermime/' "${_base}-${pkgver}/Makefile"
}

build() {
  cd ${_base}-${pkgver}
  make
}

package() {
  cd ${_base}-${pkgver}
  install -d "${pkgdir}/usr/bin/"
  install -m 755 ${pkgname} "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}
