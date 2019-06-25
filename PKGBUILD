# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=xorgxrdp
pkgver=0.2.10
pkgrel=3
pkgdesc="Xorg drivers for xrdp"
arch=('i686' 'x86_64')
url="https://github.com/neutrinolabs/xorgxrdp"
license=('MIT')
depends=('glibc')
makedepends=('nasm' 'xorg-server-devel' 'xrdp')
options=('staticlibs')
source=("https://github.com/neutrinolabs/xorgxrdp/releases/download/v$pkgver/xorgxrdp-$pkgver.tar.gz"{,.asc})
sha256sums=('74b907ceae993f9d6c1a717a67fbde4443cdb0ccff89de2852a448537f176f18'
            'SKIP')
validpgpkeys=('61ECEABBF2BB40E3A35DF30A9F72CDBC01BF10EB')  # Koichiro IWAO <meta@vmeta.jp>


build() {
  cd "$pkgname-$pkgver"

  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "$pkgname-$pkgver"

  #make check
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/$pkgname"
}
