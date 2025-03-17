# Maintainer: OZON TECH
# Maintainer: Aleksandr Lutsai <s.lyra@ya.ru>

pkgname=oze-canopen-viewer
pkgver=0.1.0
pkgrel=1
pkgdesc="Real-time CanOpen traffic sniffer for Linux with low latency GUI. Compatible with socket CAN drivers."
arch=("x86_64")
url="https://github.com/ozontech/oze-canopen-viewer"
license=("Apache-2.0")
depends=()
makedepends=("cargo" "git" "base-devel")
provides=("oze-canopen-viewer")
conflicts=("oze-canopen-viewer")
source=(
  "git+https://github.com/ozontech/oze-canopen-viewer.git#tag=oze-canopen-viewer-v${pkgver}"
  "oze-canopen-viewer.desktop"
)
sha256sums=('SKIP' 'SKIP')
install=oze-canopen-viewer.install

build() {
  cd "$srcdir/oze-canopen-viewer"
  cargo build --release
}

package() {
  # Bin
  install -Dm755 "$srcdir/oze-canopen-viewer/target/release/oze-canopen-viewer" \
    "$pkgdir/usr/bin/oze-canopen-viewer"

  # Desktop
  install -Dm644 "$srcdir/oze-canopen-viewer.desktop" \
    "$pkgdir/usr/share/applications/oze-canopen-viewer.desktop"

  # Docs
  install -Dm644 "$srcdir/oze-canopen-viewer/doc/description.md" \
    "$pkgdir/usr/share/doc/oze-canopen-viewer/description.md"
  install -Dm644 "$srcdir/oze-canopen-viewer/doc/description_ru.md" \
    "$pkgdir/usr/share/doc/oze-canopen-viewer/description_ru.md"
}