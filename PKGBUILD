# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributors: Frederic Bezies, Ronan Rabouin

pkgname=yamagi-quake2-ctf
pkgver=1.08
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Quake II - Three Wave Capture The Flag for yamagi-quake2"
url="http://www.yamagi.org/quake2/"
license=('GPL' 'custom')
depends=('sh' 'yamagi-quake2')
makedepends=('cmake' 'ninja')
source=("http://deponie.yamagi.org/quake2/${pkgname#*-}-$pkgver.tar.xz"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('f20d0f6c49484f68d21ab002ace9fa90ca09d8f1ee7400724385f6641201a3e5'
            '9a9abd8d720a719180713163261fed154ec34787c82dda2b9465aefd9890b64c'
            '1191c20ea0e7609d28b44d678ff02b2f06b95a7037d1adfd02e963a62b8f3af2')

build() {
  rm -rf build
  cmake ${pkgname#*-}-$pkgver -Bbuild \
    -DCMAKE_BUILD_TYPE=Release \
    -GNinja
  cmake --build build
}

package() {
  # game library
  install -Dm644 build/Release/game.so "$pkgdir"/usr/lib/yamagi-quake2/ctf/game.so

  cd ${pkgname#*-}-$pkgver

  # game launcher
  install -Dm755 ../$pkgname.sh "$pkgdir"/usr/bin/$pkgname

  # doc
  install -Dm644 README "$pkgdir"/usr/share/doc/$pkgname/README

  # desktop entry
  install -Dm644 ../$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop

  # license
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
