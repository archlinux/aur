# Maintainer: Thomas "Ventto" Venriès <thomas.venries@gmail.com>

pkgname=lux
pkgver=1.0
pkgrel=2
pkgdesc='Bash script to easily control brightness on backlight controllers.'
arch=('any')
url="https://github.com/Ventto/${pkgname}.git"
license=('GPL3')
depends=('bash')
provides=("${pkgname}")
conflicts=("${pkgname}")
makedepends=('help2man')
source=("https://github.com/Ventto/lux/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  help2man -N -n "${pkgdesc}" -h -h -v -v ./${pkgname} | gzip - > ${pkgname}.1.gz
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 ${pkgname}.1.gz ${pkgdir}/usr/share/man/man1/${pkgname}.1.gz
  install -Dm644 rules.d/99-${pkgname}.rules ${pkgdir}/etc/udev/rules.d/99-${pkgname}.rules
  install -Dm755 src/${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
}
