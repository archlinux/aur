# Maintainer: Thomas "Ventto" Venriès <thomas.venries@gmail.com>

pkgname=pearlfan
pkgver=1.1
pkgrel=2
pkgdesc='Tool to control Pearl USB LED fan.'
arch=('x86_64')
url="https://github.com/Ventto/${pkgname}"
license=('GPL3')
provides=("${pkgname}")
conflicts=("${pkgname}")
makedepends=('help2man' 'netpbm')
source=("https://github.com/Ventto/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('500a56f6ed87b00a674f498714c83dc136265efb73c43a9ed26409768903ebf0')

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
