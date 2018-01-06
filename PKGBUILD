# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Alessio 'mOLOk' Bolognino <themolok@gmail.com>
# Contributor: keith <keith@hubbard.net>

pkgname=mp3gain
pkgver=1.5.2
pkgrel=3
pkgdesc="Lossless mp3 normalizer with statistical analysis "
arch=('x86_64')
url="http://mp3gain.sourceforge.net"
license=("GPL")
depends=('glibc')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-${pkgver//./_}-src.zip
	build-fix.patch)
md5sums=('d888563538ec863eeea8afc8207b2739'
         '20680cbada13ba941b0532ff94e583e1')

prepare() {
    cd "$srcdir"
    patch -p0 Makefile <"$srcdir"/build-fix.patch
}

build() {
    cd "$srcdir"
    make OSTYPE=linux
}

package() {
    cd "$srcdir"
    mkdir -p "$pkgdir"/usr/bin
    make OSTYPE=linux INSTALL_PATH="$pkgdir"/usr/bin install
}
