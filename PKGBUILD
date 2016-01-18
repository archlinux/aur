# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Past maintainer: Joris Steyn <jorissteyn@gmail.com>
# Contributor: TDY <tdy@gmx.com>
pkgname=iozone
pkgver=3_434
pkgrel=1
pkgdesc="A filesystem benchmark tool"
arch=('i686' 'x86_64')
url="http://www.iozone.org/"
license=('custom')
depends=('sh')
optdepends=('gnuplot: for generating graph reports')
install=$pkgname.install
source=(http://www.${pkgname}.org/src/current/${pkgname}${pkgver}.tar)
md5sums=('3e8f4213581407225065b91774e970ed')

build() {
  cd "${srcdir}/${pkgname}${pkgver}/src/current"

  if [[ "${CARCH}" == 'x86_64' ]];
  then
    TARGET='-AMD64'
  fi

  make linux${TARGET} CFLAGS="${CFLAGS}"
}

package() {
  cd "${srcdir}/${pkgname}${pkgver}/src/current"
  make DESTDIR="${pkgdir}"

  install -D -m 755 ${srcdir}/${pkgname}${pkgver}/src/current/iozone ${pkgdir}/usr/bin/iozone
  install -D -m 755 ${srcdir}/${pkgname}${pkgver}/src/current/fileop ${pkgdir}/usr/bin/fileop
  install -D -m 755 ${srcdir}/${pkgname}${pkgver}/src/current/pit_server ${pkgdir}/usr/bin/pit_server
}
