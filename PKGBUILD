# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Please report issues at https://github.com/sanduhrs/arch-aur-phpqa

_pkgname=phpqa
pkgname=${_pkgname}
pkgver=0.4.0
pkgrel=1
pkgdesc="PHPQA all-in-one Analyzer CLI tool."
arch=("any")
url="https://github.com/jmolivas/phpqa"
license=("MIT")
depends=("php")
makedepends=("php-composer" "git")
source=("${pkgname}-${pkgver}"::"https://github.com/jmolivas/phpqa/archive/${pkgver}.tar.gz")
md5sums=('c8d8fb3df954cf8e2ab2ebab6d9f8078')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  php /usr/bin/composer install --no-dev
}

package() {
  cd "${srcdir}"

  install -d "${pkgdir}/usr/share/webapps/${_pkgname}"
  cp -r "${_pkgname}-${pkgver}" "${pkgdir}/usr/share/webapps/${_pkgname}"

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/${_pkgname}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
