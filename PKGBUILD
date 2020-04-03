# Maintainer: danieltetraquark

pkgname=grocy
pkgver=2.6.2
pkgrel=1
pkgdesc="web-based self-hosted groceries & household management solution for your home"
depends=('php' 'php-sqlite')
license=('MIT')
arch=('any')
url="https://grocy.info/"
source=(
https://github.com/grocy/grocy/releases/download/v${pkgver}/grocy_${pkgver}.zip
)
sha256sums=('93a456eb67a99d4371368073d9e3c31a63926b28fef51a5627a2f30dcaf653b2')

backup=('etc/webapps/grocy/config.php')

package() {
    _instdir="$pkgdir"/usr/share/webapps/grocy
    mkdir -p "$_instdir" "$pkgdir"/etc/webapps/grocy


    # install license
    install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cp -ra "$srcdir"/. "$_instdir"/

   cp "$srcdir"/config-dist.php "$pkgdir"/etc/webapps/grocy/config.php
    ln -s /etc/webapps/grocy/config.php "$pkgdir"/usr/share/webapps/grocy/data/config.php

  chown http "$pkgdir"/usr/share/webapps/grocy/data -R
}

