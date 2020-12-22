# Maintainer: danieltetraquark

pkgname=grocy
pkgver=3.0.0
pkgrel=1
pkgdesc="web-based self-hosted groceries & household management solution for your home"
depends=('php' 'php-sqlite' 'php-gd')
license=('MIT')
arch=('any')
url="https://grocy.info/"
source=(
https://github.com/grocy/grocy/releases/download/v${pkgver}/grocy_${pkgver}.zip
)
sha256sums=('3bb0e4b1f03de481ef2c9c91ad61bc88409c5140ec3adcad77bf24a0d65d4331')

backup=('etc/webapps/grocy/config.php')

package() {
    # delete source zip, not needed in webroot
    rm grocy_${pkgver}.zip

    _instdir="$pkgdir"/usr/share/webapps/grocy
    mkdir -p "$_instdir" "$pkgdir"/etc/webapps/grocy


    # install license
    install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cp -ra "$srcdir"/. "$_instdir"/

    cp "$srcdir"/config-dist.php "$pkgdir"/etc/webapps/grocy/config.php
    ln -s /etc/webapps/grocy/config.php "$pkgdir"/usr/share/webapps/grocy/data/config.php

    chown 33 "$pkgdir"/usr/share/webapps/grocy/data -R
}

