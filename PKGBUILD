# Maintainer: Alex "grevus" Lobtsov <alex@lobtsov.com>
pkgname=php-browscap
pkgver=6.1.0
pkgrel=1
pkgdesc="PHP browscap"
url="http://browscap.org/"
arch=('x86_64' 'i686')
license=('PHP')
depends=(
    'php'
    'curl'
)
backup=(
    'etc/php/conf.d/browscap.ini'
    'etc/php/extra/browscap.ini'
)

source=(
    https://github.com/browscap/browscap/archive/${pkgver}.tar.gz
    browscap.conf.ini
)

build() {
  cd "browscap-$pkgver"
  curl -s https://getcomposer.org/installer | php
  php composer.phar install
  bin/browscap build ${pkgver}
}

package() {
  cd "browscap-$pkgver"
  install -Dm644 build/full_php_browscap.ini "$pkgdir/etc/php/extra/browscap.ini"
  install -Dm644 ${srcdir}/browscap.conf.ini "$pkgdir/etc/php/conf.d/browscap.ini"
}

sha256sums=('1d8e7391e6bba2bbd010370a6aea80a0c4e3d7b24f4a8cf287f49677fe51be7c'
            'ab973c3fd8d4842430f70d144278c150061b6e2ff77d7b367f9921fa728ad169')
