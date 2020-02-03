# Maintainer: danieltetraquark

pkgname=grocy
pkgver=2.6.0
pkgrel=1
pkgdesc="web-based self-hosted groceries & household management solution for your home"
depends=('php' 'php-sqlite')
license=('MIT')
arch=('any')
url="https://grocy.info/"
source=(
https://github.com/grocy/grocy/releases/download/v${pkgver}/grocy_${pkgver}.zip
)
sha256sums=('53adc1636c3fcb8beb7b5183f1c2a6ab4209b10f5141eb4804f7d85812f190b4')

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

