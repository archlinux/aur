#!/bin/bash

# Maintainer: pika02 <pikakolendo02 at gmail dot com>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Stefan Seemayer <mail@semicolonsoftware.de>

pkgname=jalview
pkgver=2.11.5.0
pkgrel=1
pkgdesc='Bioinformatics Multiple Alignment Editor'
arch=(any)
url='https://www.jalview.org/'
license=('GPL3')
depends=('java-runtime')
makedepends=('tar')
source=(
    "http://www.jalview.org/getdown/release/install4j/1.8/jalview-${pkgver//./_}-unix-java_8.tar.gz"
    'jalview'
    'jalview.desktop'
)
noextract=("jalview-${pkgver//./_}-unix-java_8.tar.gz")
sha256sums=('8e6da00cae9e655bdcf1d3c8e1b0eb2800e8f9b7c49922a64fd3b9e1b49db982'
            'dbe5edfa9b17a1f85083b5aae16ef7a186a0d0035e6a81761cf73d0e1121ce58'
            'fa870de0d4ec5be2dfc93405f7e618541737533a34705893274fdfea7dae0600')

prepare() {
    mkdir -p ./$pkgname-$pkgver
    tar -xzvf ./*.tar.gz -C ./$pkgname-$pkgver --strip-components 1
}

package() {
    install -Dm755 -t "$pkgdir/usr/bin/" "$pkgname"
    install -Dm644 -t "$pkgdir/usr/share/applications/" 'jalview.desktop'

    install -Dm644 -t "$pkgdir/usr/share/java/$pkgname" "$srcdir/$pkgname-$pkgver/release/"*.jar

    install -Dm644 "$srcdir/$pkgname-$pkgver/resource/jalview_logo.png" "$pkgdir/usr/share/pixmaps/jalview_logo.png"
    # install -Dm644 "$srcdir/$pkgname-$pkgver/resource/jalview_logos.ico" "$pkgdir/usr/share/pixmaps/jalview_logos.ico"
}
