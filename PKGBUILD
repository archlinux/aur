# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Please report issues at https://github.com/sanduhrs/arch-aur-php-compat-info

_pkgname=php-compat-info
pkgname=${_pkgname}
pkgver=5.0.11
pkgrel=1
pkgdesc="Library that find out the minimum version and the extensions required for a piece of code to run."
arch=('any')
url="http://php5.laurent-laville.org/compatinfo/"
license=('BSD')
depends=('php' 'php-intl')
makedepends=("php-box" "php-composer")
source=("${_pkgname}-${pkgver}"::"https://github.com/llaville/php-compat-info/archive/${pkgver}.tar.gz")
sha512sums=('2f0f82b5c05091210a113af7cce36d802878f05d32ffaec198670291a831218617a295f7ef9c22b568ca5ddf0dd341883862ec07a97fb81751d5e6eb1b9eef26')

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
