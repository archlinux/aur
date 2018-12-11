# Maintainer: Bruno Galeotti <bgaleotti at gmail dot com>
# Co-Mantainer: Stefan Auditor <stefan.auditor@erdfisch.de>

_pkgname=php-cs-fixer
pkgname=${_pkgname}
pkgver=2.13.1
pkgrel=1
pkgdesc="Analyzes some PHP source code and tries to fix coding standards issues (PSR-1 and PSR-2 compatible)."
url="http://cs.sensiolabs.org/"
license=("MIT")
arch=("any")
depends=("php>=5.6" "php<7.3")
makedepends=("php-box" "php-composer" "git")
source=("${_pkgname}"::"git+https://github.com/FriendsOfPHP/PHP-CS-Fixer#tag=v${pkgver}")
md5sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgname}"
  php /usr/bin/composer install --prefer-dist --no-dev
  php -d phar.readonly=Off /usr/bin/php-box build
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -D -m755 "${_pkgname}.phar" "${pkgdir}/usr/bin/${_pkgname}"
}
