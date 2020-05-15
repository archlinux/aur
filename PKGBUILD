# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=xiringuito
pkgver=0.2.1
pkgrel=1
pkgdesc='SSH-based "VPN for poors"'
arch=('any')
url='https://github.com/ivanilves/xiringuito'
license=('Apache')
depends=('bash')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('d77b35db299d049c393dacec6708fcc6a6122572ae46fda67d6ceec5104aa86e')

prepare() {
  cd "${pkgname}-${pkgver}"
  sed -i "1s|/usr/local/xiringuito|${pkgdir}/usr/share/xiringuito|" Makefile
  sed -i "2s|/usr/local/bin|${pkgdir}/usr/bin|" Makefile
}

package() {
  cd "${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/xiringuito"
  mkdir -p "${pkgdir}/usr/bin"
  make INSTALL_ROOT="${pkgdir}" install
  rm "${pkgdir}/usr/share/xiringuito/Makefile"
  sed -i "s|${pkgdir}||" ${pkgdir}/usr/bin/*
}
# vim:set ts=2 sw=2 et: