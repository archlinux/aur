pkgname=verdana-bin
pkgver=0.0.5
pkgrel=1
pkgdesc="Binary release of Verdana, a launcher for Nostr napps"
arch=('x86_64' 'aarch64')
url="https://github.com/fiatjaf/verdana"
license=('MIT')
depends=(
  'gtk3'
  'webkit2gtk-4.1'
  'wayland'
  'libxkbcommon'
  'libxkbcommon-x11'
  'libx11'
  'libxcursor'
  'libxfixes'
  'libglvnd'
  'vulkan-icd-loader'
)
provides=('verdana')
conflicts=('verdana')
options=('!strip')
source=(
  "LICENSE::https://raw.githubusercontent.com/fiatjaf/verdana/v${pkgver}/LICENSE"
)
source_x86_64=(
  "${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/fiatjaf/verdana/releases/download/v${pkgver}/verdana-linux-amd64.tar.gz"
)
source_aarch64=(
  "${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/fiatjaf/verdana/releases/download/v${pkgver}/verdana-linux-arm64.tar.gz"
)
sha256sums=('739cd8db84559818267c3d73e4700ca9d3f1c721da1757a533b1eb8ee6d82e33')
sha256sums_x86_64=('08fa83cd38425f35ed713ed3f021148bdbc6cbd12ac668ffc695f069ce51163b')
sha256sums_aarch64=('7c8157307a55ec1a91c1d599ac41e12b39ceb52c51b76119e8015228fd051b4e')

package() {
  local upstream_arch
  case "$CARCH" in
    x86_64) upstream_arch=amd64 ;;
    aarch64) upstream_arch=arm64 ;;
  esac

  local app_dir="$srcdir/verdana-linux-${upstream_arch}"
  install -Dm755 "$app_dir/verdana" "$pkgdir/usr/bin/verdana"
  install -Dm644 "$app_dir/com.verdana.app.desktop" \
    "$pkgdir/usr/share/applications/com.verdana.app.desktop"
  install -Dm644 "$app_dir/com.verdana.app.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/com.verdana.app.png"
  install -Dm644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
