# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributors: Frederic Bezies, Ronan Rabouin

pkgname=yamagi-quake2-ctf
pkgver=1.10
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Quake II - Three Wave Capture The Flag for yamagi-quake2"
url="https://www.yamagi.org/quake2/"
license=('GPL' 'custom')
depends=('sh' 'yamagi-quake2')
source=("http://deponie.yamagi.org/quake2/${pkgname#*-}-$pkgver.tar.xz"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('f4cb494dd3fe36b012e547524157dac4222c5f45d1dcd713e6abdbf981e8fc23'
            '9a9abd8d720a719180713163261fed154ec34787c82dda2b9465aefd9890b64c'
            '1191c20ea0e7609d28b44d678ff02b2f06b95a7037d1adfd02e963a62b8f3af2')

build() {
  make -C ${pkgname#*-}-$pkgver
}

package() {
  cd ${pkgname#*-}-$pkgver

  # game library
  install -Dm644 -t "$pkgdir"/usr/lib/yamagi-quake2/ctf release/game.so

  # game launcher
  install -Dm755 ../$pkgname.sh "$pkgdir"/usr/bin/$pkgname

  # doc
  install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname README

  # desktop entry
  install -Dm644 -t "$pkgdir"/usr/share/applications ../$pkgname.desktop

  # license
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
