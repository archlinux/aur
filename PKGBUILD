# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>

pkgname=drush-launcher
pkgver=0.7.4
pkgrel=1
pkgdesc='A small wrapper around Drush for your global $PATH.'
arch=('any')
url="https://github.com/drush-ops/drush-launcher"
license=('GPL')
depends=('php')
makedepends=('git' 'composer' 'php-box')
conflicts=('drush' 'drush-git' 'drush-launcher-git')
source=("${pkgname}"::"git+https://github.com/drush-ops/drush-launcher.git#tag=${pkgver}")
md5sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}"
    php /usr/bin/composer install --prefer-dist --no-dev --no-interaction
    php -d phar.readonly=Off /usr/bin/php-box build
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm755 drush.phar "${pkgdir}/usr/bin/drush"
}
