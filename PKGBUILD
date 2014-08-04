# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=duckmarines-git
pkgver=1.0b.r3.g0388f24
pkgrel=1
pkgdesc="Free software remake of Sonic Team's ChuChu Rocket (development version)"
arch=('any')
url="http://tangramgames.dk/games/duckmarines/"
license=('zlib' 'CCPL')
depends=('love')
makedepends=('zip')
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}")
source=("git+https://github.com/SimonLarsen/duckmarines.git"
        "duckmarines.sh"
        "duckmarines.desktop")
sha256sums=('SKIP'
            '0023f4949c45a9fdbef807a0295340c01f97d288bd1ce1d78e8c1a5fad0f6045'
            '1a7bd7e614f147a117622f42854048c36afe24dad3c9e2e5a3b206b43104bad4')

pkgver() {
  cd duckmarines
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd duckmarines
  # generate love file
  rm -f duckmarines.love
  zip -9 -q -r duckmarines.love . -x ".git/*"
}

package() {
  cd duckmarines

  # generated love package + launcher
  install -Dm644 duckmarines.love "$pkgdir"/usr/share/duckmarines/duckmarines.love
  install -Dm755 ../duckmarines.sh "$pkgdir"/usr/bin/duckmarines
  # readme + license
  install -Dm644 README.md "$pkgdir"/usr/share/doc/duckmarines/README.md
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
  # desktop entry
  install -Dm644 ../duckmarines.desktop "$pkgdir"/usr/share/applications/duckmarines.desktop
  install -Dm644 res/icons/48x48.png "$pkgdir"/usr/share/pixmaps/duckmarines.png
}
