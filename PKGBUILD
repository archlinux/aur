# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Please report issues at https://github.com/sanduhrs/arch-aur-drupalconsole

_pkgname=drupalconsole
pkgname=${_pkgname}
pkgver=1.0.0_rc22
pkgrel=1
pkgdesc="The Drupal Console is a suite of tools that you run on a command line interface (CLI) to generate boilerplate code and interact with a Drupal 8 installation."
arch=('any')
url="http://drupalconsole.com/"
license=('GPL')
depends=('php')
makedepends=("php-box" "php-composer" "git")
install="${_pkgname}.install"
source=("${_pkgname}-${pkgver//_/-}"::"https://github.com/hechoendrupal/drupal-console-launcher/archive/${pkgver//_/-}.tar.gz")
sha512sums=('e3b29ae3ef013835cdeea29c2e53de5cf1703aeafdd35c83ddc431ed3459ecfd770f3e898a408ceca3a0273021ecbc73f4face473a10e739e53b46122383cd9d')

build() {
  cd "${srcdir}/drupal-console-launcher-${pkgver//_/-}"
  php /usr/bin/composer install --no-dev
  php -d phar.readonly=Off /usr/bin/php-box build
}

package() {
  cd "${srcdir}/drupal-console-launcher-${pkgver//_/-}"
  install -D -m755 "drupal.phar" "${pkgdir}/usr/bin/drupal"
}
