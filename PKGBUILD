# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Please report issues at https://github.com/sanduhrs/arch-aur-drupal-check

_pkgname=drupal-check
pkgname=${_pkgname}
pkgver=1.4.0
pkgrel=2
pkgdesc="Check Drupal code for deprecations and discover bugs via static analysis."
arch=('any')
url="https://github.com/mglaman/drupal-check"
license=('GPL')
depends=('php')
makedepends=("php-box" "composer" "git")
source=("${_pkgname}::git+${url}.git#tag=${pkgver}")
sha512sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgname}"
  php /usr/bin/composer install --prefer-dist

  ulimit -Sn 2048
  php -d phar.readonly=Off /usr/bin/box compile
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -D -m755 "${_pkgname}.phar" "${pkgdir}/usr/bin/${_pkgname}"
}
