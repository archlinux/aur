# Maintainer: danieltetraquark

pkgname=grocy
pkgver=2.7.1
pkgrel=3
pkgdesc="web-based self-hosted groceries & household management solution for your home"
depends=('php' 'php-sqlite' 'php-gd')
license=('MIT')
arch=('any')
url="https://grocy.info/"
source=(
https://github.com/grocy/grocy/releases/download/v${pkgver}/grocy_${pkgver}.zip
)
sha256sums=('f95cc2cc279a6445738ef9b5cc05a8cee438348d343081a76a6aa74464f76129')

backup=('etc/webapps/grocy/config.php')

package() {
    _instdir="$pkgdir"/usr/share/webapps/grocy
    mkdir -p "$_instdir" "$pkgdir"/etc/webapps/grocy


    # install license
    install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cp -ra "$srcdir"/. "$_instdir"/

    cp "$srcdir"/config-dist.php "$pkgdir"/etc/webapps/grocy/config.php
    ln -s /etc/webapps/grocy/config.php "$pkgdir"/usr/share/webapps/grocy/data/config.php

    chown 33 "$pkgdir"/usr/share/webapps/grocy/data -R
}

