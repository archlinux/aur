# Contributor: Tibor Bamhor <tiborb95 at gmail dot com>
# Maintainer: Jason Gardner (buhrietoe at gmail dot com)

pkgname=ale
pkgver=0.9.0.3
pkgrel=4
pkgdesc="Anti-Lamenessing Engine - image enhancement tools"
url="http://repo.or.cz/w/Ale.git"
license=('GPL')
arch=('i686' 'x86_64')
depends=('perl-exiftool' 'imagemagick' 'dcraw')

source=('https://src.fedoraproject.org/lookaside/pkgs/ale/ale-0.9.0.3.tar.gz/ace3d9874577085112adbf409f27b069/ale-0.9.0.3.tar.gz')

md5sums=('ace3d9874577085112adbf409f27b069')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    sed -i 's/!defined @ARGV || //' ale
    ./configure
    make || return 1
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR=${pkgdir} install
    cd ${pkgdir}
    mkdir -p usr/bin/
    cp usr/local/bin/* usr/bin
    rm -rf usr/local
}
