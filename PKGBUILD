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
            '89c0674b1e79e74ad4bb9ff0850e845f3937dc1225f57e8a84ff116676eef2db')
# makepkg 7.x auto-extracts archive sources; the jar isn't a source tree and
# its top-level jalview/ directory collides with the launcher script
noextract=("jalview-all-${pkgver}-j1.8.jar")

package() {
    install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/jalview.desktop" "$pkgdir/usr/share/applications/jalview.desktop"

    # Since 2.11.5.3 upstream only ships the all-in-one JAR
    install -Dm644 "$srcdir/jalview-all-${pkgver}-j1.8.jar" \
        "$pkgdir/usr/share/java/$pkgname/jalview-all-${pkgver}-j1.8.jar"

    install -d "$pkgdir/usr/share/pixmaps"
    bsdtar -xOf "$srcdir/jalview-all-${pkgver}-j1.8.jar" \
        images/jalview_logo-128.png > "$pkgdir/usr/share/pixmaps/jalview_logo.png"
}
