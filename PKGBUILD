# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributors: Frederic Bezies, Ronan Rabouin

pkgname=yamagi-quake2-xatrix
pkgver=2.10
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Quake II - Mission Pack 1 ('The Reckoning') for yamagi-quake2"
url="https://www.yamagi.org/quake2/"
license=('GPL' 'custom')
depends=('sh' 'yamagi-quake2')
install=$pkgname.install
source=("https://deponie.yamagi.org/quake2/${pkgname#*-}-$pkgver.tar.xz"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('80b7824959e2c04e8c0289f47d49c950492ddc5da4d77da11effafb7903b2e48'
            '7c60d4bd78a528f5cf08425cfdcb87dacf574d3912c44439e623e35f37fbc972'
            'e65add2561c7dc4a14061e17a24436f768b69968fbc6fa06022acf9e17d80854')

build() {
  make -C ${pkgname#*-}-$pkgver
}

package() {
  cd ${pkgname#*-}-$pkgver

  # game library
  install -Dm644 -t "$pkgdir"/usr/lib/yamagi-quake2/xatrix release/game.so

  # game launcher
  install -Dm755 ../$pkgname.sh "$pkgdir"/usr/bin/$pkgname

  # doc
  install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname README

  # desktop entry
  install -Dm644 -t "$pkgdir"/usr/share/applications ../$pkgname.desktop

  # license
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
