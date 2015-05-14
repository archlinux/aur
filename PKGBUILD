# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=liblcf
pkgver=0.3
pkgrel=1
pkgdesc="Library to handle RPG Maker 2000/2003 and EasyRPG projects"
arch=('i686' 'x86_64')
url="https://easy-rpg.org/"
license=('MIT')
depends=('gcc-libs' 'expat' 'icu')
source=("https://easy-rpg.org/downloads/player/liblcf-$pkgver.tar.gz")
sha256sums=('6fa1fcf9735bc5cff112a95f12b1803bf43b39d719df1a0064952c9de49327af')

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
