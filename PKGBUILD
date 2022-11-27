# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=tyrquake
pkgver=0.71
pkgrel=1
pkgdesc="A conservative Quake port"
arch=('x86_64')
url="http://disenchant.net/tyrquake/"
license=(GPL2)
depends=(libglvnd libpulse)
install=tyrquake.install
source=("http://disenchant.net/files/engine/$pkgname-$pkgver.tar.gz")
b2sums=('1ffbc4bd1a6243e73e36f3ffbfd2f5d8154399e42f41d6b16d35acdfd04782d31d05a70c30dea611397276f71e7ef64e800ce15ef0f40dd549e360ccc8534688')

build() {
  cd "$pkgname-$pkgver"

  make QBASEDIR=/usr/share/games/quake
}

package() {
  cd "$pkgname-$pkgver"

  install -D bin/tyr-* -t "$pkgdir/usr/bin"
  install -Dm 644 man/tyrquake.6 "$pkgdir/usr/share/man/man6/tyr-quake.6"

  for page in glquake glqwcl qwcl qwsv; do
    ln -s tyr-quake.6 "$pkgdir/usr/share/man/man6/tyr-${page}.6"
  done
}
