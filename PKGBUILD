#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Stefan Seemayer <mail@semicolonsoftware.de>

pkgname=jalview
pkgver=2.11.2.0
pkgrel=1
pkgdesc='Bioinformatics Multiple Alignment Editor'
arch=(any)
url='https://www.jalview.org/'
license=('GPL3')
depends=('java-runtime')
makedepends=('tar')
source=(
    "http://www.jalview.org/getdown/release/install4j/1.8/jalview-2_11_2_0-unix-java_8.tar.gz"
    'jalview'
    'jalview.desktop'
)
noextract=("jalview-2_11_2_0-unix-java_8.tar.gz")
b2sums=('bfd83d1e3cfc691a0e0c81420223968cf7d7358e31a8bf6ed459a87a7dc589e1b805983450c3755524965cd3d89d83197089a12c0dc6087957ba892838c2058c'
        'e14717693a06411bd9703f8e627ba424f11eefc9640ad60e7deac05be75eaa5615b623bcb95291982735225fc7971e21d49540624b91dd8e597d651ed0cfb526'
        '0b7ae3fef150e5f6d2c9ac12abceaab2cf5de9a5ed33005f4aed8c87fc6fad2d1d0d56b37fa46183d7a190020cac7edb1c8e477a92ba58d6bc22fdf87fcb4bc0')

prepare() {
    mkdir -p ./$pkgname-$pkgver
    tar -xzvf ./*.tar.gz -C ./$pkgname-$pkgver --strip-components 1
}

package() {
    install -Dm755 -t "$pkgdir/usr/bin/" "$pkgname"
    install -Dm644 -t "$pkgdir/usr/share/applications/" 'jalview.desktop'

    install -Dm644 -t "$pkgdir/usr/share/java/$pkgname" $srcdir/$pkgname-$pkgver/release/*.jar

    install -Dm644 "$srcdir/$pkgname-$pkgver/resource/jalview_logo.png" "$pkgdir/usr/share/pixmaps/jalview_logo.png"
    # install -Dm644 "$srcdir/$pkgname-$pkgver/resource/jalview_logos.ico" "$pkgdir/usr/share/pixmaps/jalview_logos.ico"
}
