# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Please report issues at https://github.com/sanduhrs/arch-aur-php-cs-fixer-git

_pkgname=php-cs-fixer
pkgname=${_pkgname}-git
pkgver=1.11.r121.g9a83ba0
pkgrel=1
pkgdesc="Analyzes some PHP source code and tries to fix coding standards issues (PSR-1 and PSR-2 compatible)."
url="http://cs.sensiolabs.org/"
license=("MIT")
arch=("any")
depends=("php>=5.3.6")
makedepends=("php-box" "php-composer" "git")
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("${_pkgname}"::"git+https://github.com/FriendsOfPHP/PHP-CS-Fixer")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}-${pkgver}"
  git describe --long --tags | sed 's/\([^v-]*-g\)/r\1/;s/-/./g' | sed 's/^v//g'
}

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
