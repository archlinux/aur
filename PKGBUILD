# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=xorgxrdp
pkgver=0.9.19
pkgrel=2
pkgdesc="Xorg drivers for xrdp"
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/neutrinolabs/xorgxrdp"
license=('MIT')
depends=('glibc')
makedepends=('libxfont2' 'nasm' 'xorg-server-devel' 'xrdp')
options=('staticlibs')
source=("https://github.com/neutrinolabs/xorgxrdp/releases/download/v$pkgver/xorgxrdp-$pkgver.tar.gz"{,.asc})
sha256sums=('c1cf4c583c28a24ce814c147d387b8f4d255877f2e365372c69c6f076ddb1455'
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
