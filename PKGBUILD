pkgname=plotune-bin
pkgver=1.0.31
pkgrel=2
pkgdesc="Plotune – Modular data operations and signal orchestration platform"
arch=('x86_64')
url="https://www.plotune.net"
license=('custom')

provides=('plotune')
conflicts=('plotune')

depends=(
  'glibc'
  'fontconfig'
  'freetype2'
  'libxkbcommon'
  'libxkbcommon-x11'
  'mesa'
  'hicolor-icon-theme'
)

# CRITICAL: Nuitka onefile binary MUST NOT be stripped
options=(!strip)

source=(
  "plotune-linux-x86_64.tar.gz::https://github.com/baksi-org/plotune-dl/releases/download/v${pkgver}/plotune-linux-x86_64.tar.gz"
  "plotune.desktop"
)

sha256sums=('SKIP' 'SKIP')

package() {
  cd "$srcdir/plotune-linux-x86_64"

  # Binary
  install -Dm755 plotune "$pkgdir/usr/bin/plotune"

  # Assets
  install -d "$pkgdir/usr/share/plotune"
  cp -r assets "$pkgdir/usr/share/plotune/"

  # Desktop entry
  install -Dm644 "$srcdir/plotune.desktop" \
    "$pkgdir/usr/share/applications/plotune.desktop"

  # Icon (standard freedesktop path)
  install -Dm644 assets/logo.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/plotune.png"
}
