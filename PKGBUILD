# Maintainer: An Nguyen (stk) <an@linux.com>
# Contrinutor: twa022 <twa022 at gmail dot com>
# Contrinutor: Tasos Latsas <tlatsas@gmx.com>
# Contributor: Patrick Palka <patrick@parcs.ath.cx>
# Contributor: damir <damir@archlinux.org>
# Development: http://closure.ath.cx/aur-dev

pkgname=bs
pkgver=2.15
pkgrel=1
pkgdesc="The classic game of Battleships against the computer. Ncurses."
arch=('i686' 'x86_64')
url="http://www.catb.org/~esr/bs/"
license=('BSD-2-Clause')
depends=('glibc' 'ncurses' 'hicolor-icon-theme')
makedepends=('asciidoctor')
source=("http://www.catb.org/~esr/bs/bs-$pkgver.tar.gz"
        'Makefile_fix.patch'
        'bs_fix.patch')
sha256sums=('007d8cf2740c7a923fbc0db8a4f69d356812e52c9a654e495e6fb748ad2cb898'
            'c365f25c70353b0b00a2cf078f9ff76ca144141733505039d6a9025ff0b611cb'
            '41eb069b252b151c6994a78df29bbe71e5a3372cf9988a0671c56a037d022bdc')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np1 -i ../Makefile_fix.patch
  patch -Np1 -i ../bs_fix.patch
}

build() {
  cd "${pkgname}-${pkgver}"
  make bs bs.6
}

package() {
  cd "${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
