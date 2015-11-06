# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributors: Frederic Bezies, Ronan Rabouin

pkgname=yamagi-quake2-ctf
pkgver=1.03
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Quake II - Three Wave Capture The Flag for yamagi-quake2"
url="http://www.yamagi.org/quake2/"
license=('GPL' 'custom')
depends=('sh' 'yamagi-quake2')
changelog=$pkgname.ChangeLog
source=("http://deponie.yamagi.org/quake2/${pkgname#*-}-$pkgver.tar.xz"
        "$pkgname.sh" "$pkgname.desktop")
sha256sums=('f6bc9c27015533e4f64ee99a8df91fb8f83b13402ef8647aa054b925844818d0'
            '9a9abd8d720a719180713163261fed154ec34787c82dda2b9465aefd9890b64c'
            'da8c69eb05eb9aab8526616b2808c7535ae38c1e28b5e7db341ff633bc09be31')

build() {
  make -C ${pkgname#*-}-$pkgver
}

package() {
  cd ${pkgname#*-}-$pkgver

  # game launcher
  install -Dm755 ../$pkgname.sh "$pkgdir"/usr/bin/$pkgname

  # game library
  install -Dm644 release/game.so "$pkgdir"/usr/share/yamagi-quake2/ctf/game.so

  # doc
  install -Dm644 README "$pkgdir"/usr/share/doc/$pkgname/README

  # desktop entry
  install -Dm644 ../$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop

  # license
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
