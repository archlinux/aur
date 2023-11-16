# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributors: Frederic Bezies, Ronan Rabouin

pkgname=yamagi-quake2-rogue
pkgver=2.11
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Quake II - Mission Pack 2 ('Ground Zero') for yamagi-quake2"
url="https://www.yamagi.org/quake2/"
license=('GPL' 'custom')
depends=('sh' 'yamagi-quake2')
install=$pkgname.install
source=("https://deponie.yamagi.org/quake2/${pkgname#*-}-$pkgver.tar.xz"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('5a06592b8305a98e1f6c50a1873c4c90a220ec2a6bdde295379d0969799308f2'
            '7d43bd0ca15a6c82560153deea1df1109d0a448b226e316b6b7b5daae256241a'
            'e7ee884b1e015743659cf668afa521976de64345872acf8e4c1e6932355c2959')

build() {
  make -C ${pkgname#*-}-$pkgver
}

package() {
  cd ${pkgname#*-}-$pkgver

  # game library
  install -Dm644 -t "$pkgdir"/usr/lib/yamagi-quake2/rogue release/game.so

  # game launcher
  install -Dm755 ../$pkgname.sh "$pkgdir"/usr/bin/$pkgname

  # doc
  install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname README

  # desktop entry
  install -Dm644 -t "$pkgdir"/usr/share/applications ../$pkgname.desktop

  # license
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
