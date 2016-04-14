# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Please report issues at https://github.com/sanduhrs/arch-aur-robo

_pkgname=robo
pkgname=${_pkgname}
pkgver=0.7.2
pkgrel=1
pkgdesc="Modern task runner for PHP."
arch=("any")
url="http://robo.li"
license=("MIT")
depends=("php")
makedepends=("php-composer" "git")
source=("${_pkgname}"::"git+https://github.com/Codegyre/Robo.git")
sha512sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgname}"
  php /usr/bin/composer install --no-dev
}

package() {
  cd "${srcdir}"
  install -D -m 644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -d "${pkgdir}/usr/share/webapps/${_pkgname}"
  cp -r "${_pkgname}" "${pkgdir}/usr/share/webapps/"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/${_pkgname}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
