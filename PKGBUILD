pkgname=roton-bin
pkgver=1.0.0
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
  '4a3f78599a9a3a60b8ffc9ead24d5ce8ad6318f06dc97f9557debecf9a19b2d8'
  '0767117be62ce9dc8bd04bf393845475dd688512599d4b58ec8ac8f4afad7705'
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
