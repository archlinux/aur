# Maintainer: Thomas "Ventto" Venriès <thomas.venries@gmail.com>

pkgname=mons
pkgver=0.1
pkgrel=2
pkgdesc='Bash script to quickly manage 2-monitors display using xrandr.'
arch=('any')
url="https://github.com/Ventto/${pkgname}.git"
license=('MIT')
depends=('bash' 'xorg-xrandr')
provides=("${pkgname}")
conflicts=("${pkgname}")
makedepends=('help2man')
source=("https://github.com/Ventto/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  help2man -N -n "${pkgdesc}" -h -h -v -v ./${pkgname} | gzip - > ${pkgname}.1.gz
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 ${pkgname}.1.gz ${pkgdir}/usr/share/man/man1/${pkgname}.1.gz
  install -Dm755 src/${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
}
