# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Please report issues at https://github.com/sanduhrs/arch-aur-php-codesniffer-drupal-git

_pkgname=php-codesniffer-drupal
pkgname=${_pkgname}-git
pkgver=r1273.4d1de90
pkgrel=1
pkgdesc="Drupal coding standard for PHP_CodeSniffer"
arch=("any")
url="http://drupal.org/project/coder"
license=("GPL")
depends=("php-codesniffer")
makedepends=("git")
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("${_pkgname}"::"git+https://git.drupal.org/project/coder.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -d "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/Drupal"
    cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}/coder_sniffer/Drupal/" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
    install -d "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/DrupalPractice"
    cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}/coder_sniffer/DrupalPractice/" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
}
