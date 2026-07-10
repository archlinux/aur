# Maintainer: ldgnu <ldgnu@users.noreply.github.com>
# Binary package (prebuilt) for minitone

pkgname=minitone-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="TUI music player for YouTube, Radio Browser, Navidrome and local files (prebuilt)"
arch=('x86_64' 'aarch64')
url="https://github.com/ldgnu/minitone"
license=('MIT')
depends=('mpv')
optdepends=(
  'yt-dlp: YouTube search and stream resolve'
)
provides=('minitone')
conflicts=('minitone')

# Map Arch arch → release asset arch name
_arch_map() {
  case "$CARCH" in
    x86_64)  echo amd64 ;;
    aarch64) echo arm64 ;;
    *)       echo "$CARCH" ;;
  esac
}
_goarch="$(_arch_map)"

source_x86_64=("${pkgname%-bin}-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/minitone-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname%-bin}-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/minitone-${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
  install -Dm755 minitone "${pkgdir}/usr/bin/minitone"
  if [[ -f README.md ]]; then
    install -Dm644 README.md "${pkgdir}/usr/share/doc/minitone/README.md"
  fi
}
