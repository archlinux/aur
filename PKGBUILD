# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Please report issues at https://github.com/sanduhrs/arch-aur-php-compat-info

_pkgname=php-compat-info
pkgname=${_pkgname}
pkgver=5.0.10
pkgrel=1
pkgdesc="Library that find out the minimum version and the extensions required for a piece of code to run."
arch=('any')
url="http://php5.laurent-laville.org/compatinfo/"
license=('BSD')
depends=('php' 'php-intl')
makedepends=("php-box" "php-composer")
source=("${_pkgname}-${pkgver}"::"https://github.com/llaville/php-compat-info/archive/${pkgver}.tar.gz")
sha512sums=('bfc9a1a56413de766be9a24e427052c9b7a575638cb89ea2bc282a1baf7891df3c4fb4c33a6c619619d6cbb48fe55f024a3b64175d5d9a44415405b39c619a85')

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
