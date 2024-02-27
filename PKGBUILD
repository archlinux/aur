# Maintainer: Stefan Auditor <stefan@auditor.email>

pkgname=drush-launcher
pkgver=0.10.2
pkgrel=1
pkgdesc='A small wrapper around Drush for your global $PATH.'
arch=('any')
url="https://github.com/drush-ops/drush-launcher"
license=('GPL')
depends=('php')
makedepends=('git' 'composer')
conflicts=('drush' 'drush-git' 'drush-launcher-git')
source=("${pkgname}"::"git+https://github.com/drush-ops/drush-launcher.git#tag=${pkgver}")
md5sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}"
    composer install --prefer-dist --no-progress --no-suggest
    php /usr/bin/composer box-install
    php /usr/bin/composer box-compile
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm755 drush.phar "${pkgdir}/usr/bin/drush"
}
