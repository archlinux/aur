# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=tyrquake
pkgver=0.61
pkgrel=1
pkgdesc="A conservative Quake port"
arch=('i686' 'x86_64')
url="http://disenchant.net/tyrquake/"
license=(GPL2)
depends=(libgl libxxf86vm libxxf86dga)
install=tyrquake.install
source=("http://disenchant.net/files/engine/$pkgname-$pkgver.tar.gz")
sha256sums=('1a51a5bbcb7dcf296c46e1dc9108fd74c4969b9b6ac3c5b1f33ff967fba3f843')

build() {
  cd "$pkgname-$pkgver"

  [ "$CARCH" = "i686" ] && _asm=Y || _asm=N

  make QBASEDIR=/usr/share/games/quake \
       USE_X86_ASM=$_asm               \
       OPTIMIZED_CFLAGS=N              \
       STRIP=true
}

package() {
  cd "$pkgname-$pkgver"

  install -d "$pkgdir/usr/bin"
  install tyr-* "$pkgdir/usr/bin"
}
