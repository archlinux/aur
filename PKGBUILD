pkgname=roton-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Roton Screen Recording App (binary release)"
arch=("x86_64")
url="https://github.com/ferdinankurnian/roton"
license=("MIT")
depends=("scrop" "ffmpeg" "pipewire-pulse" "wl-screenrec")

source=(
  "roton-${pkgver}.tar.gz::https://github.com/ferdinankurnian/roton/releases/download/v${pkgver}/roton-v${pkgver}-linux-x86_64.tar.gz"
  "README-${pkgver}.md::https://raw.githubusercontent.com/ferdinankurnian/roton/v${pkgver}/README.md"
  "roton.desktop"
)

sha256sums=(
  '9309e3354a02e407ef791c86ff53c66f27598e81536d6ac61071453f178760a4'
  '2c469268af4fe045b3858f43cb726bc6abf4245b46f876ee1270e9d65890d40f'
  'SKIP'
)

package() {
  cd "${srcdir}/roton-v${pkgver}-linux-x86_64"

  install -Dm755 roton "$pkgdir/usr/lib/roton/roton"
  cp -a assets "$pkgdir/usr/lib/roton/"

  install -Dm755 /dev/null "$pkgdir/usr/bin/roton"
  printf '%s\n' \
    '#!/bin/sh' \
    'cd /usr/lib/roton || exit 1' \
    'exec ./roton "$@"' \
    > "$pkgdir/usr/bin/roton"

  install -Dm644 "$srcdir/roton.desktop" \
    "$pkgdir/usr/share/applications/roton.desktop"

  install -Dm644 "$srcdir/README-${pkgver}.md" \
    "$pkgdir/usr/share/doc/roton/README.md"

  install -Dm644 assets/rotonicon.png \
    "$pkgdir/usr/share/pixmaps/roton.png"
}
