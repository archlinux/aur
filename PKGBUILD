#!/usr/bin/env bash
# shellcheck disable=SC2034
# Maintainer: Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=herdr-gpui
pkgver=20261005.1
pkgrel=1
pkgdesc="Native GPUI client for an installed Herdr daemon"
arch=('x86_64' 'aarch64')
url="https://github.com/penso/herdr-gpui"
license=('Apache-2.0')
depends=('glibc>=2.39' 'gcc-libs' 'alsa-lib' 'freetype2' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'wayland' 'vulkan-icd-loader')

source_x86_64=(
  "Herdr-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/penso/herdr-gpui/releases/download/v${pkgver}/Herdr-${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
)
sha256sums_x86_64=('6fdf58c8b9074fd264adbfe1ee21d1c746ae3ea3f1d7dc6de012fe6dd1b0f0ee')
sha256sums_aarch64=('daa6edf8a018b322aa9152d9baf442c725c77d9b85f8eeed53ca9c47672ad94c')

source_aarch64=(
  "Herdr-${pkgver}-aarch64-unknown-linux-gnu.tar.gz::https://github.com/penso/herdr-gpui/releases/download/v${pkgver}/Herdr-${pkgver}-aarch64-unknown-linux-gnu.tar.gz"
)

package() {
  local _release_dir="${srcdir}/Herdr-${pkgver}-${CARCH}-unknown-linux-gnu"

  install -Dm755 "${_release_dir}/bin/herdr-gpui" "${pkgdir}/usr/bin/herdr-gpui"
  install -Dm644 "${_release_dir}/share/applications/herdr-gpui.desktop" \
    "${pkgdir}/usr/share/applications/herdr-gpui.desktop"
  install -Dm644 "${_release_dir}/share/icons/hicolor/scalable/apps/herdr-gpui.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/herdr-gpui.svg"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 "${_release_dir}/share/licenses/herdr-gpui/"* \
    "${pkgdir}/usr/share/licenses/${pkgname}/"
}
