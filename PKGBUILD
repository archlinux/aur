# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributors: Frederic Bezies, Ronan Rabouin

_pkgbase=quake2-rogue
pkgname=yamagi-$_pkgbase
pkgver=2.00
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Quake II - Mission Pack 2 ('Ground Zero') for yamagi-quake2"
url="http://www.yamagi.org/quake2/"
license=('GPL' 'custom')
depends=('sh' 'yamagi-quake2')
install=$pkgname.install
changelog=$pkgname.ChangeLog
source=("http://deponie.yamagi.org/quake2/$_pkgbase-$pkgver.tar.xz"
        "$pkgname.sh" "$pkgname.desktop")
sha256sums=('fa3f4ad38a73b6007cf8bd2992318952555ee7d91734bc0a7d1af6016186eac5'
            '7d43bd0ca15a6c82560153deea1df1109d0a448b226e316b6b7b5daae256241a'
            'b0347a6571748b5c1176e12b7a04f0b10e982c973bc6b7c749861146bf4d05a6')

build() {
  cd $_pkgbase-$pkgver

  make
}

package() {
  cd $_pkgbase-$pkgver

  # game launcher
  install -Dm755 ../$pkgname.sh "$pkgdir"/usr/bin/$pkgname

  # game library
  install -Dm644 release/game.so "$pkgdir"/usr/share/yamagi-quake2/rogue/game.so

  # doc
  install -Dm644 README "$pkgdir"/usr/share/doc/$pkgname/README

  # desktop entry
  install -Dm644 ../$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop

  # license
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
