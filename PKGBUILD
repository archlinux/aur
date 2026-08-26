# Maintainer: Tryanks

pkgname=tcode-bin
pkgver=0.1.46
pkgrel=1
pkgdesc="A native desktop app for the coding agents you already use."
arch=('x86_64' 'aarch64')
url="https://github.com/Tryanks/tcode"
license=('MIT')
depends=(
  'alsa-lib'
  'fontconfig'
  'libxkbcommon'
  'libxkbcommon-x11'
  'libxcb'
  'libx11'
  'mesa'
  'vulkan-icd-loader'
  'wayland'
)
optdepends=(
  'amdvlk: AMD GPU Vulkan support'
  'nvidia-utils: NVIDIA GPU Vulkan support'
  'vulkan-intel: Intel GPU Vulkan support'
  'vulkan-radeon: AMD Radeon Vulkan support'
)
source_x86_64=("tcode-${pkgver}-linux-x64.tar.gz::https://github.com/Tryanks/tcode/releases/download/v${pkgver}/tcode-${pkgver}-linux-x64.tar.gz")
source_aarch64=("tcode-${pkgver}-linux-arm64.tar.gz::https://github.com/Tryanks/tcode/releases/download/v${pkgver}/tcode-${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('9f97aab5fc814336fc525f867caaccd6456a4cb4a1bdb3e659bdac9e2088fee1')
sha256sums_aarch64=('75f7d328b557974ee3c976596457f719b3856603a712d1518500b2fbd8bf1150')

package() {
  local _archdir
  case "$CARCH" in
    x86_64) _archdir="x64" ;;
    aarch64) _archdir="arm64" ;;
  esac
  cd "${srcdir}/tcode-${pkgver}-linux-${_archdir}"
  install -Dm755 bin/tcode "${pkgdir}/usr/bin/tcode"
  install -Dm644 share/applications/com.tryanks.tcode.desktop \
    "${pkgdir}/usr/share/applications/com.tryanks.tcode.desktop"
  install -Dm644 share/icons/hicolor/1024x1024/apps/com.tryanks.tcode.png \
    "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/com.tryanks.tcode.png"
}
