#!/bin/hint/bash
# Maintainer: Fredrick R. Brennan <copypaste@kittens.ph>

pkgname=jpeg2eps
pkgver=1.00
pkgrel=1
pkgdesc="Convert JPEG images to EPS (Encapsulated PostScript) format"
arch=('any')
url="http://rses.anu.edu.au/~andy/jpeg2eps/"
license=(GPL2)
makedepends=()
depends=(ghostscript)
source=("$pkgname-$pkgver.tar.gz::http://rses.anu.edu.au/~andy/jpeg2eps/jpeg2eps.tar.gz"
        "usr_share.patch"
        "usr_share.patch.asc")
b2sums=('cced55cb8122828c61cbf2f0821c5cd6d7ccc0266340b05044b91ba84f693b50468e8035bd6e32269aeee79f51b33a3d54184678992b3e5396172b8c8816da34'
        'a9e3ae75124bc561f60b17384cd4818f79aff8de665731d3d94eb33a68b15b148669781dd549b99b34d6ab94283cfeeda05ef48453cc013006adb71c1d0b183c'
        'SKIP')
validpgpkeys=('98F28F767470129FBE3B054CE2154DD1A1C77B8B') # Fredrick R. Brennan <copypaste@kittens.ph>

prepare() {
    cd "$srcdir/${pkgname}_source"
    patch -i ../usr_share.patch
}

package() {
    SRCDIR="$srcdir/${pkgname}_source"
    DESTDIR="$pkgdir/usr/bin"
    _SHAREDIR="/usr/share/jpeg2eps"
    mkdir -v -p "$DESTDIR" "$pkgdir$_SHAREDIR"
    chmod -v ugo+x "$SRCDIR/jpeg2eps"
    ln -v -s "$_SHAREDIR/jpeg2eps" "$DESTDIR/jpeg2eps"
    cp -v "$SRCDIR/"*.ps "$pkgdir$_SHAREDIR"
}

# vim:set ts=4 sw=4 et syntax=bash:
