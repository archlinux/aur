# Maintainer: danieltetraquark

pkgname=grocy
pkgver=2.6.1
pkgrel=1
pkgdesc="web-based self-hosted groceries & household management solution for your home"
depends=('php' 'php-sqlite')
license=('MIT')
arch=('any')
url="https://grocy.info/"
source=(
https://github.com/grocy/grocy/releases/download/v${pkgver}/grocy_${pkgver}.zip
)
sha256sums=('a6a2d2e5162e796d4a662354fb6a64bd24151b10eed1de8f919d5dd83bfd01bb')

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

