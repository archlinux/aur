# Maintainer: Thomas "Ventto" Venriès <thomas.venries@gmail.com>

pkgname=pearlfan
pkgver=1.1
pkgrel=1
pkgdesc='Tool to control Pearl USB LED fan.'
arch=('x86_64')
url="https://github.com/Ventto/${pkgname}"
license=('GPL3')
provides=("${pkgname}")
conflicts=("${pkgname}")
makedepends=('help2man' 'netpbm')
source=("https://github.com/Ventto/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('64192de3348df713d999700f56e5c15b3c30f49773f22ea40f4cf5b056df923b')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make
  help2man -N -n "${pkgdesc}" -h -h -v -v ./${pkgname} | gzip - > ${pkgname}.1.gz
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 ${pkgname}.1.gz ${pkgdir}/usr/share/man/man1/${pkgname}.1.gz
  cp -r tests/images ${pkgdir}/usr/share/${pkgname}/
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  chmod 4755 ${pkgdir}/usr/bin/${pkgname}
}
