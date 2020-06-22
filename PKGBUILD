# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Please report issues at https://github.com/sanduhrs/arch-aur-php-compat-info

_pkgname=php-compat-info
pkgname=${_pkgname}
pkgver=5.2.2
pkgrel=1
pkgdesc="Library that find out the minimum version and the extensions required for a piece of code to run."
arch=('any')
url="http://php5.laurent-laville.org/compatinfo/"
license=('BSD')
depends=('php' 'php-intl')
makedepends=("php-box" "php-composer")
source=("${_pkgname}-${pkgver}"::"https://github.com/llaville/php-compat-info/archive/${pkgver}.tar.gz")
sha512sums=('daced2370bc2a9b48cfb0210128c0bc978a47c86785f46de26d35df155f1b718a2bcf35b49d0def34b69c636d5e199f73640b9427719b50adbb66c47cb3e2b3a')

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
