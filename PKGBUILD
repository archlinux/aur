#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>

pkgname=spades
_name=SPAdes
pkgver=3.15.3
pkgrel=1
pkgdesc='St. Petersburg genome assembler – is an assembly toolkit containing various assembly pipelines.'
url='http://cab.spbu.ru/software/spades/'
arch=('x86_64')
license=('unknown')
depends=('python')
makedepends=(
    'gcc'
    'cmake'
    'zlib'
    'bzip2'
    'bash'
)
provides=('spades')
conflicts=(
    'spades-bin'
    'spades-git'
)
source=(
    "http://cab.spbu.ru/files/release$pkgver/$_name-$pkgver.tar.gz"
    'spades'
)
b2sums=(
    'd1c2204889ecd4e95306f10ca1bc4c1243369737822ba882ed141aa203005ce5240698b421e6f9c867684567abe971afb7562b837ad5464cfd91ce572d5e7af4'
    'bb76a52fbf7b1b8b4323e1833b237f4bcdad1c3ec16926f7147ffacb52302be9ca438fdf25026d73a2f29082b041cdc0bae69b6f62d752a696238165fe01d3ac'
)

prepare() {
    cd "$srcdir/$_name-$pkgver/" || exit
    mkdir -p bin
}

build() {
    cd "$srcdir/$_name-$pkgver/" || exit

    ./spades_compile.sh
}

check() {
    cd "$srcdir/$_name-$pkgver/bin/" || exit

    python spades.py --test
}

package() {
    cd "$srcdir/$_name-$pkgver/" || exit

    install -Dm755 "$srcdir/$pkgname" "$pkgdir'/usr/bin/$pkgname"

    mkdir -p "$pkgdir/usr/share/$pkgname/"

    cp -R 'bin' "$pkgdir/usr/share/$pkgname/"
    chmod -R 755 "$pkgdir/usr/share/$pkgname/bin"

    cp -R 'share' "$pkgdir/usr/share/$pkgname/"
    chmod -R 755 "$pkgdir/usr/share/$pkgname/share"

}
