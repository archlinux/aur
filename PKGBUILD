# shellcheck disable=SC2034,SC2154
# Maintainer: Energetix
# Based on the work of Marius Lindvall and Kevin Brubeck Unhammer

pkgname=apertium-eng-spa
pkgver=0.8.1
pkgrel=1
pkgdesc="Apertium translation pair for English and Spanish"
url="https://github.com/apertium/${pkgname}"
license=('GPL3')
makedepends=('pkgconf' 'autoconf')
depends=('apertium' 'lttoolbox' 'apertium-lex-tools')
replaces=('apertium-en-es')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.bz2::https://github.com/apertium/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('8d7ca3b0595272993342a2ab8f0195b743402aefd2a8143b21cd8dc5317ce55e')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    # ./autogen.sh --prefix=/usr
    autoreconf -fvi
    ./configure --prefix=/usr
    make
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    make check
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
