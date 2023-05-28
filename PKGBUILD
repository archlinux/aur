# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=liblcf
pkgver=0.8
pkgrel=1
pkgdesc="Library to handle RPG Maker 2000/2003 and EasyRPG projects"
arch=('i686' 'x86_64')
url="https://easyrpg.org"
license=('MIT')
provides=('lcf2xml')
depends=('gcc-libs' 'expat' 'icu')
source=("https://easyrpg.org/downloads/player/$pkgver/liblcf-$pkgver.tar.xz")
sha256sums=('6b0d8c7fefe3d66865336406f69ddf03fe59e52b5601687265a4d1e47a25c386')

build () {
  cd liblcf-$pkgver

  ./configure --prefix=/usr \
    --enable-shared --disable-static \
    --disable-update-mimedb
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
