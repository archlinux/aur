# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Please report issues at https://github.com/sanduhrs/arch-aur-phpqa

_pkgname=phpqa
pkgname=${_pkgname}
pkgver=0.2.0
pkgrel=1
pkgdesc="PHPQA all-in-one Analyzer CLI tool."
arch=("any")
url="https://github.com/jmolivas/phpqa"
license=("MIT")
depends=("php")
makedepends=("php-composer")
source=("${pkgname}-${pkgver}"::"https://github.com/jmolivas/phpqa/archive/${pkgver}.tar.gz")
md5sums=('f2c424045c703d36774e0fd796fb67b2')

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
