# Maintainer: Tryanks
#
# The release workflow's publish-aur job fills in pkgver, pkgrel and the
# checksums, then pushes this file to aur.archlinux.org/tcode-bin.git.

pkgname=tcode-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="A native desktop app for the coding agents you already use."
arch=('x86_64' 'aarch64')
url="https://github.com/Tryanks/tcode"
license=('MIT')
depends=(
  'alsa-lib'
  'fontconfig'
  'gtk3'
  'libx11'
  'libxcb'
  'libxkbcommon'
  'libxkbcommon-x11'
  'mesa'
  'vulkan-icd-loader'
  'wayland'
  'webkit2gtk-4.1'
)
optdepends=(
  'nvidia-utils: NVIDIA GPU Vulkan support'
  'vulkan-intel: Intel GPU Vulkan support'
  'vulkan-radeon: AMD GPU Vulkan support'
)
source_x86_64=("tcode-${pkgver}-linux-x64.tar.gz::https://github.com/Tryanks/tcode/releases/download/v${pkgver}/tcode-${pkgver}-linux-x64.tar.gz")
source_aarch64=("tcode-${pkgver}-linux-arm64.tar.gz::https://github.com/Tryanks/tcode/releases/download/v${pkgver}/tcode-${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('6ad06b6e9bc909202ec8743fb0c944073eb15269c75c48df9135eae2567ab8d2')
sha256sums_aarch64=('83424697f64edd5be661b45cef24f09635c4bfb238093a8bd999d30f9237eb30')

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
