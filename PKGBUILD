# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Please report issues at https://github.com/sanduhrs/arch-aur-phpqa-git

_pkgname=phpqa
pkgname=${_pkgname}-git
pkgver=0.1.0.r0.gc981e06
pkgrel=1
pkgdesc="PHPQA all-in-one Analyzer CLI tool."
arch=("any")
url="https://github.com/jmolivas/phpqa"
license=("MIT")
depends=("php")
makedepends=("php-box" "php-composer" "git")
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("${_pkgname}"::"git+https://github.com/jmolivas/phpqa.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  php /usr/bin/composer install --no-dev
}

package() {
  cd "${srcdir}"
  install -d "${pkgdir}/usr/share/webapps/${_pkgname}"
  cp -r "${_pkgname}" "${pkgdir}/usr/share/webapps/"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/${_pkgname}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
