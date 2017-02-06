# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Please report issues at https://github.com/sanduhrs/arch-aur-phpqa

_pkgname=phpqa
pkgname=${_pkgname}
pkgver=0.5.0
pkgrel=2
pkgdesc="PHPQA all-in-one Analyzer CLI tool."
arch=("any")
url="https://github.com/jmolivas/phpqa"
license=("MIT")
depends=("php")
makedepends=("php-composer" "git")
source=("${pkgname}-${pkgver}"::"https://github.com/jmolivas/phpqa/archive/${pkgver}.tar.gz")
md5sums=('02aaebb5c256a33a2d79f7ce98066ad3')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  php /usr/bin/composer install --no-dev
}

package() {
  cd "${srcdir}"

  install -d "${pkgdir}/usr/share/webapps"
  mv "${_pkgname}-${pkgver}" "${pkgdir}/usr/share/webapps/${_pkgname}/"

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/${_pkgname}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
