# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Please report issues at https://github.com/sanduhrs/arch-aur-robo

_pkgname=robo
pkgname=${_pkgname}
pkgrel=1
pkgver=4.0.6
pkgdesc="Modern task runner for PHP."
arch=("any")
url="http://robo.li"
license=("MIT")
depends=("php")
makedepends=("composer" "git")
source=("${_pkgname}"::"git+https://github.com/Codegyre/Robo.git#tag=${pkgver}")
sha512sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgname}"
  composer install --no-interaction
}

package() {
  cd "${srcdir}"
  install -D -m 644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -d "${pkgdir}/usr/share/webapps/${_pkgname}"
  cp -r "${_pkgname}" "${pkgdir}/usr/share/webapps/"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/${_pkgname}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
