# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>

pkgname=sienna-git
pkgver=r51.gba33bd8
pkgrel=1
pkgdesc="Simple, fast-paced one-button platformer (development version)"
arch=('any')
url="http://tangramgames.dk/games/sienna/"
license=('CCPL:by-nc' 'CCPL:by-nc-nd' 'zlib')
depends=('love08')
makedepends=('zip')
source=("git+https://github.com/SimonLarsen/sienna.git"
        "sienna.sh"
        "sienna.desktop"
        "sienna.png")
sha256sums=('SKIP'
            'c8dc5b2fbd8bf30c9632b814fe6577a6ba9618b52b22364ff611e160a73d3b91'
            'd0107f767feeb3228217513c99088799c8a57b79de8574aabdee57fa69d6a22b'
            '4aea1186e5a19c03ab19a5b2ec85a873503b069c123a69b903789806526ba040')

pkgver() {
  cd sienna
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd sienna
  # generate love file
  rm -f sienna.love
  zip -9 -q -r sienna.love . -x ".git/*"
}

package() {
  cd sienna

  # copy generated love package
  install -Dm644 sienna.love "$pkgdir"/usr/share/sienna/sienna.love
  # launcher
  install -Dm755 ../sienna.sh "$pkgdir"/usr/bin/sienna
  # readme + license
  install -Dm644 README.md "$pkgdir"/usr/share/doc/sienna/README.md
  install -Dm644 LICENCE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  # desktop entry
  install -Dm644 ../sienna.desktop "$pkgdir"/usr/share/applications/sienna.desktop
  install -Dm644 ../sienna.png "$pkgdir"/usr/share/pixmaps/sienna.png
}
