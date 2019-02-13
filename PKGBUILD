# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributors: Frederic Bezies, Ronan Rabouin

pkgname=yamagi-quake2-xatrix
pkgver=2.06
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Quake II - Mission Pack 1 ('The Reckoning') for yamagi-quake2"
url="http://www.yamagi.org/quake2/"
license=('GPL' 'custom')
depends=('sh' 'yamagi-quake2')
makedepends=('cmake' 'ninja')
install=$pkgname.install
source=("http://deponie.yamagi.org/quake2/${pkgname#*-}-$pkgver.tar.xz"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('b40222eb182f27c261ebab10bb50afcf7cfc9a4d8567e264c034904b3be4c05a'
            '7c60d4bd78a528f5cf08425cfdcb87dacf574d3912c44439e623e35f37fbc972'
            'e65add2561c7dc4a14061e17a24436f768b69968fbc6fa06022acf9e17d80854')

build() {
  rm -rf build
  cmake ${pkgname#*-}-$pkgver -Bbuild \
    -DCMAKE_BUILD_TYPE=Release \
    -GNinja
  cmake --build build
}

package() {
  # game library
  install -Dm644 build/Release/game.so "$pkgdir"/usr/lib/yamagi-quake2/xatrix/game.so

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
