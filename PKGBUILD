# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Please report issues at https://github.com/sanduhrs/arch-aur-php-cs-fixer-git

_pkgname=php-cs-fixer
pkgver=v3.17.0.r38.g7fd9f7bb2
pkgrel=1
pkgname=${_pkgname}-git
pkgdesc="Analyzes some PHP source code and tries to fix coding standards issues (PSR-1 and PSR-2 compatible)."
url="https://github.com/PHP-CS-Fixer/PHP-CS-Fixer"
license=("MIT")
arch=("any")
depends=("php")
makedepends=("php-box" "composer" "git")
source=("${_pkgname}::git+https://github.com/PHP-CS-Fixer/PHP-CS-Fixer")
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
