# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=liblcf
pkgver=0.2
pkgrel=1
pkgdesc="Library to handle RPG Maker 2000/2003 and EasyRPG projects"
arch=('i686' 'x86_64')
url="https://easy-rpg.org/"
license=('MIT')
depends=('gcc-libs' 'expat')
makedepends=('boost')
source=("https://easy-rpg.org/downloads/player/liblcf-$pkgver.tar.gz")
sha256sums=('fb88158fa89805b52271a21444bb1af1b31f1b8615d5fd81c9e3e05e647675de')

build () {
  cd liblcf-$pkgver

  autoreconf -i
  ./configure --prefix=/usr
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
