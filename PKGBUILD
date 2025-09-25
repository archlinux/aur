# Maintainer: Bruno Galeotti <bgaleotti at gmail dot com>
# Co-Mantainer: Stefan Auditor <stefan@auditor.email>

_pkgname=php-cs-fixer
pkgname=${_pkgname}
pkgver=3.88.0
pkgrel=1
pkgdesc="Analyzes some PHP source code and tries to fix coding standards issues (PSR-1 and PSR-2 compatible)."
url="https://github.com/PHP-CS-Fixer/PHP-CS-Fixer"
license=("MIT")
arch=("any")
depends=("php>=7.4")
makedepends=("php-box" "composer" "git")
source=("${_pkgname}-${pkgver}::git+https://github.com/PHP-CS-Fixer/PHP-CS-Fixer#tag=v${pkgver}")
md5sums=('SKIP')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  composer install --no-interaction
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  box compile --no-interaction
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}-${pkgver}/LICENSE"
  install -D -m755 "${_pkgname}.phar" "${pkgdir}/usr/bin/${_pkgname}-${pkgver}"
}
