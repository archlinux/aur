# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=yamagi-quake2-ctf-git
pkgver=1.02.r5.ge2b397d
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Quake II - Three Wave Capture The Flag for yamagi-quake2 (development version)"
url="http://www.yamagi.org/quake2/"
license=('GPL' 'custom')
depends=('sh' 'yamagi-quake2')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=(${pkgname%-*}::"git+https://github.com/yquake2/ctf.git"
        "${pkgname%-*}.sh"
        "${pkgname%-*}.desktop")
sha256sums=('SKIP'
            '9a9abd8d720a719180713163261fed154ec34787c82dda2b9465aefd9890b64c'
            'da8c69eb05eb9aab8526616b2808c7535ae38c1e28b5e7db341ff633bc09be31')

pkgver() {
  cd ${pkgname%-*}
  git describe --long --tags | sed 's/^CTF_//;s/_/./;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  make -C ${pkgname%-*}
}

package() {
  cd ${pkgname%-*}

  # game launcher
  install -Dm755 ../${pkgname%-*}.sh "$pkgdir"/usr/bin/${pkgname%-*}

  # game library
  install -Dm644 release/game.so "$pkgdir"/usr/share/yamagi-quake2/ctf/game.so

  # doc
  install -Dm644 README "$pkgdir"/usr/share/doc/${pkgname%-*}/README

  # desktop entry
  install -Dm644 ../${pkgname%-*}.desktop "$pkgdir"/usr/share/applications/${pkgname%-*}.desktop

  # license
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
