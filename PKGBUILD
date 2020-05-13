# Maintainer: Alex "grevus" Lobtsov <alex@lobtsov.com>
pkgname=php-browscap
pkgver=6.0.38
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

sha256sums=('a9e65ef016d0eece8de75395cfd84e23b4d98cc1fe4a73de0f4dcc7da161de3a'
            'ab973c3fd8d4842430f70d144278c150061b6e2ff77d7b367f9921fa728ad169')
