# Maintainer: Stefan Auditor <stefan@auditor.email>

pkgname=drush-launcher
pkgver=0.10.2
pkgrel=2
pkgdesc='A small wrapper around Drush for your global $PATH.'
arch=('any')
url="https://github.com/drush-ops/drush-launcher"
license=('GPL')
depends=('php')
makedepends=('composer' 'git' 'php-box')
conflicts=('drush' 'drush-git' 'drush-launcher-git')
source=("${pkgname}"::"git+https://github.com/drush-ops/drush-launcher.git#tag=${pkgver}")
md5sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}"

  composer --no-interaction install --prefer-source
}

build() {
  cd "${srcdir}/${pkgname}"

  php -d phar.readonly=Off /usr/bin/box compile
}

package() {
    cd "${srcdir}/${pkgname}"

    install -Dm755 drush.phar "${pkgdir}/usr/bin/drush"
}
