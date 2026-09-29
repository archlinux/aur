#!/usr/bin/env bash
# shellcheck disable=SC2034
# Maintainer: Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=herdr-gpui
pkgver=20260928.3
pkgrel=1
pkgdesc="Native GPUI client for an installed Herdr daemon"
arch=('x86_64' 'aarch64')
url="https://github.com/penso/herdr-gpui"
license=('Apache-2.0')
depends=('glibc>=2.39' 'gcc-libs' 'alsa-lib' 'freetype2' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'wayland' 'vulkan-icd-loader')

source_x86_64=(
  "Herdr-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/penso/herdr-gpui/releases/download/v${pkgver}/Herdr-${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
)
sha256sums_x86_64=('266b240332424476da21fc38c2a36b4dd833d937020fcb5e07f46904014b2fa6')
sha256sums_aarch64=('e2e1947b477dc8d6ec8151670ecb6e3c987c15887d00583b0560b473ecb256ae')

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
