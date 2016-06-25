# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Past maintainer: Joris Steyn <jorissteyn@gmail.com>
# Contributor: TDY <tdy@gmx.com>
pkgname=iozone
pkgver=3_434
pkgrel=3
pkgdesc="A filesystem benchmark tool"
arch=('i686' 'x86_64')
url="http://www.iozone.org/"
license=('custom')
depends=('sh')
optdepends=('gnuplot: for generating graph reports')
install=$pkgname.install
source=("http://www.${pkgname}.org/src/current/${pkgname}${pkgver}.tar"
	"${pkgname}${pkgver}.tar.sig")
sha512sums=('75c75a3a59aedc007222d2e6877631d41afd89f1e6702deca3f7e815a6586ad57bcc1ca55f01656bcfa9f733fda74edcc3fe241c7bef143a9aa60527e6865f59'
            'SKIP')

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
