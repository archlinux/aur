# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=liblcf
pkgver=0.7.0
pkgrel=1
pkgdesc="Library to handle RPG Maker 2000/2003 and EasyRPG projects"
arch=('i686' 'x86_64')
url="https://easyrpg.org"
license=('MIT')
provides=('lcf2xml')
depends=('gcc-libs' 'expat' 'icu')
source=("https://easyrpg.org/downloads/player/$pkgver/liblcf-$pkgver.tar.xz")
sha256sums=('ed76501bf973bf2f5bd7240ab32a8ae3824dce387ef7bb3db8f6c073f0bc7a6a')

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
