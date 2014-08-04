# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=duckmarines
pkgver=1.0b
pkgrel=1
pkgdesc="Free software remake of Sonic Team's ChuChu Rocket"
arch=('any')
url="http://tangramgames.dk/games/duckmarines/"
license=('zlib' 'CCPL')
depends=('love')
source=("https://github.com/SimonLarsen/duckmarines/releases/download/v$pkgver/duckmarines-${pkgver%b}-love.zip"
        "duckmarines.sh"
        "duckmarines.desktop"
        "duckmarines.png"::"https://raw.githubusercontent.com/SimonLarsen/duckmarines/master/res/icons/48x48.png")
sha256sums=('9b9a4d4565b2e2c38bccbbb5679118fc45999881dfbfe41c0d952f989f5eff3a'
            '0023f4949c45a9fdbef807a0295340c01f97d288bd1ce1d78e8c1a5fad0f6045'
            '1a7bd7e614f147a117622f42854048c36afe24dad3c9e2e5a3b206b43104bad4'
            'c12ed26d6c2a2f5233580f4fd2899c50c822cc36ec14344fc6c6d4c3c54724ea')

prepare() {
  # extract readme
  bsdtar xf duckmarines-${pkgver%b}-love/duckmarines-${pkgver%b}.love README.md
}

package() {
  cd duckmarines-${pkgver%b}-love

  # love package + launcher
  install -Dm644 duckmarines-${pkgver%b}.love "$pkgdir"/usr/share/duckmarines/duckmarines.love
  install -Dm755 ../duckmarines.sh "$pkgdir"/usr/bin/duckmarines
  # readme + license
  install -Dm644 ../README.md "$pkgdir"/usr/share/doc/duckmarines/README.md
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
  # desktop entry
  install -Dm644 ../duckmarines.desktop "$pkgdir"/usr/share/applications/duckmarines.desktop
  install -Dm644 ../duckmarines.png "$pkgdir"/usr/share/pixmaps/duckmarines.png
}
