# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Please report issues at https://github.com/sanduhrs/arch-aur-drupalconsole

_pkgname=drupalconsole
pkgname=${_pkgname}
pkgver=1.0.0
pkgrel=1
pkgdesc="The Drupal Console is a suite of tools that you run on a command line interface (CLI) to generate boilerplate code and interact with a Drupal 8 installation."
arch=('any')
url="http://drupalconsole.com/"
license=('GPL')
depends=('php')
makedepends=("php-box" "php-composer" "git")
install="${_pkgname}.install"
source=("${_pkgname}-${pkgver//_/-}"::"https://github.com/hechoendrupal/drupal-console-launcher/archive/${pkgver//_/-}.tar.gz")
sha512sums=('4f2ddfbeaf47c7845d60294b916a92b6077f1d7f995d2e473f47fd48ad26f9669a591585c7d4d969230f9d3d7573ea7991142718fa5e6532fd51b6343406e7a6')

build() {
  cd "${srcdir}/drupal-console-launcher-${pkgver//_/-}"
  php /usr/bin/composer install --no-dev
  ulimit -Sn 2048
  php -d phar.readonly=Off /usr/bin/php-box build
}

package() {
  cd "${srcdir}/drupal-console-launcher-${pkgver//_/-}"
  install -D -m755 "drupal.phar" "${pkgdir}/usr/bin/drupal"
}
