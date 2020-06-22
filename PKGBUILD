# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Please report issues at https://github.com/sanduhrs/arch-aur-php-compat-info

_pkgname=php-compat-info
pkgname=${_pkgname}
pkgver=5.2.1
pkgrel=1
pkgdesc="Library that find out the minimum version and the extensions required for a piece of code to run."
arch=('any')
url="http://php5.laurent-laville.org/compatinfo/"
license=('BSD')
depends=('php' 'php-intl')
makedepends=("php-box" "php-composer")
source=("${_pkgname}-${pkgver}"::"https://github.com/llaville/php-compat-info/archive/${pkgver}.tar.gz")
sha512sums=('8413862754f93368b2815433eba44ca4acc30a8dcfa99919b76e350e99b4b23fe87362216c0e1c3b78b447ecd02805892e13d76042253c2d7c77f73ea5f98be7')

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
