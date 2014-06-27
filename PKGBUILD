# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>

pkgname=sienna-git
pkgver=1.0b.r0.g57bee5c
pkgrel=1
pkgdesc="Simple, fast-paced one-button platformer (development version)"
arch=('any')
url="http://tangramgames.dk/games/sienna/"
license=('CCPL:by-nc' 'CCPL:by-nc-nd' 'zlib')
depends=('love')
makedepends=('zip')
source=("git+https://github.com/SimonLarsen/sienna.git"
        "sienna.sh"
        "sienna.desktop"
        "sienna.png")
sha256sums=('SKIP'
            'ec57e73af7b9246d865853cf094a18fff548e1a88576f2dee006576c4f7eabe4'
            'd0107f767feeb3228217513c99088799c8a57b79de8574aabdee57fa69d6a22b'
            '4aea1186e5a19c03ab19a5b2ec85a873503b069c123a69b903789806526ba040')

pkgver() {
  cd sienna
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
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
