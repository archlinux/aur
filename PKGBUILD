# Maintainer: Thomas "Ventto" Venriès <thomas.venries@gmail.com>

pkgname=mons
pkgver=0.6.2
pkgrel=1
pkgdesc='POSIX Shell script to quickly manage 2-monitors display.'
arch=('any')
url="https://github.com/Ventto/${pkgname}.git"
license=('MIT')
depends=('xorg-xrandr')
provides=("${pkgname}")
conflicts=("${pkgname}")
makedepends=('help2man')
source=("https://github.com/Ventto/${pkgname}/archive/v${pkgver}.tar.gz"
        "https://github.com/Ventto/posix-shell-list/archive/v1.0.tar.gz")

sha256sums=('SKIP' 'SKIP')

prepare() {
  cd ${srcdir}
  rm -r ${pkgname}-${pkgver}/posix-shell-list
  mv 'posix-shell-list-1.0' ${pkgname}-${pkgver}/posix-shell-list
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  help2man -N -n "${pkgdesc}" -h -h -v -v ${pkgname} | gzip - > ${pkgname}.1.gz
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 ${pkgname}.1.gz ${pkgdir}/usr/share/man/man1/${pkgname}.1.gz
  make DESTDIR="${pkgdir}" install
}
