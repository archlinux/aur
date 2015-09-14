# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=liblcf
pkgver=0.3.2
pkgrel=1
pkgdesc="Library to handle RPG Maker 2000/2003 and EasyRPG projects"
arch=('i686' 'x86_64')
url="https://easy-rpg.org/"
license=('MIT')
depends=('gcc-libs' 'expat' 'icu')
source=("https://easy-rpg.org/downloads/player/liblcf-$pkgver.tar.gz")
sha256sums=('57b89776a029752bf4cd12d2dec75a97c47d7367168c629b8b7c55d1285675e0')

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
