pkgname=plotune-bin
pkgver=1.0.581
pkgrel=1
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
  'python'
  'uv'
  'qt6-base'
  'qt6-svg'
)

options=(!strip)

source=(
  "plotune-linux-x86_64.tar.gz::https://github.com/plotune/plotune-dl/releases/download/v${pkgver}/plotune-linux-x86_64.tar.gz"
  "plotune.desktop"
  "plotune-mime.xml"
)

sha256sums=('SKIP' 'SKIP' 'SKIP')

package() {
  cd "$srcdir/plotune-linux-x86_64"

  install -d "$pkgdir/usr/lib/plotune"

  install -Dm755 plotune "$pkgdir/usr/lib/plotune/plotune"

  cp -r core    "$pkgdir/usr/lib/plotune/core"
  cp -r futures "$pkgdir/usr/lib/plotune/futures"
  cp -r assets  "$pkgdir/usr/lib/plotune/assets"

  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/plotune/plotune "$pkgdir/usr/bin/plotune"

  install -Dm644 "$srcdir/plotune.desktop" \
    "$pkgdir/usr/share/applications/plotune.desktop"

  install -Dm644 "$srcdir/plotune-mime.xml" \
    "$pkgdir/usr/share/mime/packages/plotune.xml"

  install -Dm644 assets/logo.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/plotune.png"
}
