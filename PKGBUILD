#!/usr/bin/env bash
# shellcheck disable=SC2034
# Maintainer: Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=herdr-gpui
pkgver=20261019.1
pkgrel=1
pkgdesc="Native GPUI client for an installed Herdr daemon"
arch=('x86_64' 'aarch64')
url="https://github.com/penso/herdr-gpui"
license=('Apache-2.0')
depends=('glibc>=2.39' 'gcc-libs' 'alsa-lib' 'freetype2' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'wayland' 'vulkan-icd-loader')

source_x86_64=(
  "Herdr-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/penso/herdr-gpui/releases/download/v${pkgver}/Herdr-${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
)
sha256sums_x86_64=('fcdd288c88c38c7a6169c7f5089d6e4c6f5575d102aeb54e00ca7ec6e28fc924')
sha256sums_aarch64=('8f64922c48e97c41edf5fd94c9e3d7e3671ca7ac3f4fa2ae471785bb2427fde3')

source_aarch64=(
  "Herdr-${pkgver}-aarch64-unknown-linux-gnu.tar.gz::https://github.com/penso/herdr-gpui/releases/download/v${pkgver}/Herdr-${pkgver}-aarch64-unknown-linux-gnu.tar.gz"
)

package() {
  local _release_dir="${srcdir}/Herdr-${pkgver}-${CARCH}-unknown-linux-gnu"

  install -Dm755 "${_release_dir}/bin/herdr-gpui" "${pkgdir}/usr/bin/herdr-gpui"
  install -Dm644 "${_release_dir}/share/applications/so.pen.herdr-gpui.desktop" \
    "${pkgdir}/usr/share/applications/so.pen.herdr-gpui.desktop"
  install -Dm644 "${_release_dir}/share/icons/hicolor/scalable/apps/herdr-gpui.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/herdr-gpui.svg"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 "${_release_dir}/share/licenses/herdr-gpui/"* \
    "${pkgdir}/usr/share/licenses/${pkgname}/"
}
