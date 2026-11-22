#!/bin/bash

# Maintainer: pika02 <pikakolendo02 at gmail dot com>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Stefan Seemayer <mail@semicolonsoftware.de>

pkgname=jalview
pkgver=2.11.5.3
pkgrel=1
pkgdesc='Bioinformatics Multiple Alignment Editor'
arch=(any)
url='https://www.jalview.org/'
license=('GPL3')
depends=('java-runtime')
source=(
    "https://www.jalview.org/getdown/release/jalview-all-${pkgver}-j1.8.jar"
    'jalview'
    'jalview.desktop'
)
sha256sums=('5691657031ec9019f1ee75208be52aa0315581cc7574b4c7a906fa10d589c90e'
            'dbe5edfa9b17a1f85083b5aae16ef7a186a0d0035e6a81761cf73d0e1121ce58'
            'fa870de0d4ec5be2dfc93405f7e618541737533a34705893274fdfea7dae0600')

package() {
    install -Dm755 -t "$pkgdir/usr/bin/" "$pkgname"
    install -Dm644 -t "$pkgdir/usr/share/applications/" 'jalview.desktop'

    # Since 2.11.5.3 upstream only ships the all-in-one JAR
    install -Dm644 -t "$pkgdir/usr/share/java/$pkgname" \
        "$srcdir/jalview-all-${pkgver}-j1.8.jar"

    bsdtar -xOf "$srcdir/jalview-all-${pkgver}-j1.8.jar" \
        images/jalview_logo-128.png > "$pkgdir/usr/share/pixmaps/jalview_logo.png"
}
