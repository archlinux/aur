# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=yamagi-quake2-xatrix-git
pkgver=2.09.r1.g15791dc
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Quake II - Mission Pack 1 ('The Reckoning') for yamagi-quake2 (development version)"
url="https://www.yamagi.org/quake2/"
license=('GPL' 'custom')
depends=('sh' 'yamagi-quake2')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
install=${pkgname%-*}.install
source=(${pkgname%-*}::"git+https://github.com/yquake2/xatrix.git"
        "${pkgname%-*}.sh"
        "${pkgname%-*}.desktop")
sha256sums=('SKIP'
            '7c60d4bd78a528f5cf08425cfdcb87dacf574d3912c44439e623e35f37fbc972'
            'e65add2561c7dc4a14061e17a24436f768b69968fbc6fa06022acf9e17d80854')

pkgver() {
  cd ${pkgname%-*}
  git describe --long --tags | sed 's/^XATRIX_//;s/_/./;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  make -C ${pkgname%-*}
}

package() {
  local pkg=${pkgname%-*}

  cd $pkg

  # game library
  install -Dm644 -t "$pkgdir"/usr/lib/yamagi-quake2/xatrix release/game.so

  # game launcher
  install -Dm755 ../$pkg.sh "$pkgdir"/usr/bin/$pkg

  # doc
  install -Dm644 -t "$pkgdir"/usr/share/doc/$pkg README

  # desktop entry
  install -Dm644 -t "$pkgdir"/usr/share/applications ../$pkg.desktop

  # license
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
