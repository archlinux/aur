# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=liblcf
pkgver=0.5.3
pkgrel=1
pkgdesc="Library to handle RPG Maker 2000/2003 and EasyRPG projects"
arch=('i686' 'x86_64')
url="https://easyrpg.org"
license=('MIT')
depends=('gcc-libs' 'expat' 'icu')
source=("https://easyrpg.org/downloads/player/liblcf-$pkgver.tar.gz")
sha256sums=('6f350d676bfbd292531909920c71e6b8d20e27a45f54620261cbd9d16b3150fc')

build () {
  cd liblcf-$pkgver

  ./configure --prefix=/usr --enable-shared --disable-static
  make
}

check() {
  make -C liblcf-$pkgver check
}

package () {
  cd liblcf-$pkgver

  make DESTDIR="$pkgdir/" install
  # license
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
