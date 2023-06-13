# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Please report issues at https://github.com/sanduhrs/arch-aur-php-cs-fixer-git
# Maintainer: Bruno Galeotti <bgaleotti at gmail dot com>
# Co-Mantainer: Stefan Auditor <stefan@auditor.email>
_pkgname=php-cs-fixer
pkgname=${_pkgname}
pkgver=v3.17.0.r0.g3f0ed862f
pkgrel=1
pkgdesc="Analyzes some PHP source code and tries to fix coding standards issues (PSR-1 and PSR-2 compatible)."
url="https://github.com/PHP-CS-Fixer/PHP-CS-Fixer"
license=("MIT")
arch=("any")
depends=("php>=7.1.3")
makedepends=("php-box" "composer" "git")
source=("${_pkgname}::git+https://github.com/PHP-CS-Fixer/PHP-CS-Fixer#tag=v${pkgver}")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  composer install --no-interaction
}

build() {
  cd "${srcdir}/${_pkgname}"
  box compile --no-interaction
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -D -m755 "${_pkgname}.phar" "${pkgdir}/usr/bin/${_pkgname}"
}
