#!/usr/bin/env bash
# shellcheck disable=SC2034
# Maintainer: Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=herdr-gpui
pkgver=20260925.2
pkgrel=1
pkgdesc="Native GPUI client for an installed Herdr daemon"
arch=('x86_64' 'aarch64')
url="https://github.com/penso/herdr-gpui"
license=('Apache-2.0')
depends=('glibc>=2.39' 'gcc-libs' 'alsa-lib' 'freetype2' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'wayland' 'vulkan-icd-loader')

source_x86_64=(
  "Herdr-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/penso/herdr-gpui/releases/download/v${pkgver}/Herdr-${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
)
sha256sums_x86_64=('193349dff996235d80d74d91f0ac5891c1e71c498f38a5f83fe7bc1bd13fcae0')
sha256sums_aarch64=('e98b99604702de3ac314a52720d9cdf66e4bc3a135724f2271489d348b9871f7')

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
