# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=liblcf
pkgver=0.6.0
pkgrel=1
pkgdesc="Library to handle RPG Maker 2000/2003 and EasyRPG projects"
arch=('i686' 'x86_64')
url="https://easyrpg.org"
license=('MIT')
depends=('gcc-libs' 'expat' 'icu')
source=("https://easyrpg.org/downloads/player/$pkgver/liblcf-$pkgver.tar.xz")
sha256sums=('a9089c502cdf5f075073cc46263fc3723d4344f461110c691e259772bc377a32')

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
