# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Please report issues at https://github.com/sanduhrs/arch-aur-drupalconsole

_pkgname=drupalconsole
pkgname=${_pkgname}
pkgver=1.0.0_rc1
pkgrel=2
pkgdesc="The Drupal Console is a suite of tools that you run on a command line interface (CLI) to generate boilerplate code and interact with a Drupal 8 installation."
arch=('any')
url="http://drupalconsole.com/"
license=('GPL')
depends=('php')
makedepends=("php-box" "php-composer" "git")
install="${_pkgname}.install"
source=("${_pkgname}"::"https://github.com/hechoendrupal/drupal-console-launcher/archive/${pkgver//_/-}.tar.gz")
sha512sums=('e4f9511b10b196056075e9d819dbd957fe10e10b18e8be940f91785f7e06c83791b25c9b526341752b6415ea3e4b8c80c0eb096f9ec1428f64d7f81229e29a43')

build() {
  cd "${srcdir}/drupal-console-launcher-${pkgver//_/-}"
  php /usr/bin/composer install --no-dev
  php -d phar.readonly=Off /usr/bin/php-box build
}

package() {
  cd "${srcdir}/drupal-console-launcher-${pkgver//_/-}"
  install -D -m755 "drupal.phar" "${pkgdir}/usr/bin/drupal"
}
