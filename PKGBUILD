# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=yamagi-quake2-ctf-git
pkgver=1.08.r1.g5e4fc5a
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Quake II - Three Wave Capture The Flag for yamagi-quake2 (development version)"
url="https://www.yamagi.org/quake2/"
license=('GPL' 'custom')
depends=('sh' 'yamagi-quake2')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=(${pkgname%-*}::"git+https://github.com/yquake2/ctf.git"
        "${pkgname%-*}.sh"
        "${pkgname%-*}.desktop")
sha256sums=('SKIP'
            '9a9abd8d720a719180713163261fed154ec34787c82dda2b9465aefd9890b64c'
            '1191c20ea0e7609d28b44d678ff02b2f06b95a7037d1adfd02e963a62b8f3af2')

pkgver() {
  cd ${pkgname%-*}
  git describe --long --tags | sed 's/^CTF_//;s/_/./;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  make -C ${pkgname%-*}
}

package() {
  local pkg=${pkgname%-*}

  cd $pkg

  # game library
  install -Dm644 -t "$pkgdir"/usr/lib/yamagi-quake2/ctf release/game.so

  # game launcher
  install -Dm755 ../$pkg.sh "$pkgdir"/usr/bin/$pkg

  # doc
  install -Dm644 -t "$pkgdir"/usr/share/doc/$pkg README

  # desktop entry
  install -Dm644 -t "$pkgdir"/usr/share/applications ../$pkg.desktop

  # license
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
