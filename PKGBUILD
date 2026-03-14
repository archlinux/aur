# Maintainer: Mattia Moffa <mattia [at] moffa [dot] xyz>

pkgname=wolfssl-all
_pkgname=${pkgname%-all}
pkgver=5.8.4
pkgrel=1
pkgdesc="Lightweight, portable, C-language-based SSL/TLS library (built with --enable-all)"
arch=(x86_64)
url="https://www.wolfssl.com/"
license=('GPL-3.0-or-later')
makedepends=(autoconf automake libtool)
provides=(wolfssl libwolfssl.so)
conflicts=(wolfssl)
source=("$_pkgname-$pkgver-stable.tar.gz::https://github.com/$_pkgname/$_pkgname/archive/refs/tags/v$pkgver-stable.tar.gz"
        "https://github.com/$_pkgname/$_pkgname/releases/download/v$pkgver-stable/$_pkgname-$pkgver-stable.tar.gz.asc")
sha512sums=('6f191c218b270bd4dc90d6f07a80416e6bc8d049f3f49ea84c38a2af40ae9588a4fe306860fbb8696c5af15c4ca359818e3955069389d33269eee0101c270439'
            'SKIP')
b2sums=('38afff3fcdfcff40f5d52feb8efd24d74f9a641cd028a270835cc680cf27cecd9a8119ca3d5a04510cfdb39aacce00fe884a8c8d6c74a92990204da2aca79454'
        'SKIP')
validpgpkeys=(
    A2A48E7BCB96C5BECB987314EBC80E415CA29677 # wolfSSL <secure@wolfssl.com>
)

build() {
	cd "$_pkgname-$pkgver-stable"
    ./autogen.sh
	./configure --prefix=/usr --enable-all --enable-reproducible-build --enable-static
	make
}

check() {
	cd "$_pkgname-$pkgver-stable"
	WOLFSSL_EXTERNAL_TEST=0 make check
}

package() {
	cd "$_pkgname-$pkgver-stable"
	make DESTDIR="$pkgdir/" install
}
