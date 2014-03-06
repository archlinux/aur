# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>

pkgname=duckmarines-git
pkgver=r137.gc55d104
pkgrel=1
pkgdesc="Free software remake of Sonic Team's ChuChu Rocket (development version)"
arch=('any')
url="http://tangramgames.dk/games/duckmarines/"
license=('UNKNOWN')
depends=('love')
makedepends=('zip')
source=("git+https://github.com/SimonLarsen/duckmarines.git"
        "duckmarines.sh"
        "duckmarines.desktop"
        "duckmarines.png")
sha256sums=('SKIP'
            '0023f4949c45a9fdbef807a0295340c01f97d288bd1ce1d78e8c1a5fad0f6045'
            'f33ca99a1c4c3f165755100e1b797b09bc900245add2b8b342128dd7c875ba6a'
            'aa5983e79d0677d8dbf2c3c62cad59d9c7af8fa4cd1dcb95321fa44c621c24c8')

pkgver() {
  cd duckmarines
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd duckmarines
  # generate love file
  rm -f duckmarines.love
  zip -9 -q -r duckmarines.love . -x ".git/*"
}

package() {
  cd duckmarines

  # copy generated love package
  install -Dm644 duckmarines.love "$pkgdir"/usr/share/duckmarines/duckmarines.love
  # launcher
  install -Dm755 ../duckmarines.sh "$pkgdir"/usr/bin/duckmarines
  # readme
  install -Dm644 README.md "$pkgdir"/usr/share/doc/duckmarines/README.md
  # desktop entry
  install -Dm644 ../duckmarines.desktop "$pkgdir"/usr/share/applications/duckmarines.desktop
  install -Dm644 ../duckmarines.png "$pkgdir"/usr/share/pixmaps/duckmarines.png
}
