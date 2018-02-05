# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Please report issues at https://github.com/sanduhrs/arch-aur-php-compat-info

_pkgname=php-compat-info
pkgname=${_pkgname}
pkgver=5.0.12
pkgrel=1
pkgdesc="Library that find out the minimum version and the extensions required for a piece of code to run."
arch=('any')
url="http://php5.laurent-laville.org/compatinfo/"
license=('BSD')
depends=('php' 'php-intl')
makedepends=("php-box" "php-composer")
source=("${_pkgname}-${pkgver}"::"https://github.com/llaville/php-compat-info/archive/${pkgver}.tar.gz")
sha512sums=('2a94f660f05b4c7a24486270fe975d82542befa4bca7c014918ade0ab325c81348938fd5b30bc94ba937cf450bfc71d2453ddb893d27bdc74f88ee3e875cd8a9')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  sed -i '/git-version/d' box.json

  php /usr/bin/composer install
  php -d phar.readonly=Off /usr/bin/php-box build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -D -m755 "default.phar" "${pkgdir}/usr/bin/phpcompatinfo"
}
