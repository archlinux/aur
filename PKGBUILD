#!/usr/bin/env bash
# shellcheck disable=SC2034
# Maintainer: Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=sheprd-bin
pkgver=20261109.1
pkgrel=1
pkgdesc="Native GPUI client for an installed Herdr daemon (formerly herdr-gpui)"
arch=('x86_64' 'aarch64')
url="https://github.com/sheprd-labs/sheprd"
license=('Apache-2.0')
depends=('glibc>=2.39' 'gcc-libs' 'alsa-lib' 'freetype2' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'wayland' 'vulkan-icd-loader')
provides=('sheprd' 'herdr-gpui')
conflicts=('sheprd' 'herdr-gpui')
replaces=('herdr-gpui')

source_x86_64=(
  "Sheprd-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/sheprd-labs/sheprd/releases/download/v${pkgver}/Sheprd-${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
)
sha256sums_x86_64=('1e09833688e647c8299a4261680d5d2eb2a70f5ddd7a49aa8cadaa72977b592c')
sha256sums_aarch64=('483bad7acda6509ca4b3ca233455ae1cd19b3bb69625dd4f7c6742922960505b')

source_aarch64=(
  "Sheprd-${pkgver}-aarch64-unknown-linux-gnu.tar.gz::https://github.com/sheprd-labs/sheprd/releases/download/v${pkgver}/Sheprd-${pkgver}-aarch64-unknown-linux-gnu.tar.gz"
)

package() {
  local _release_dir="${srcdir}/Sheprd-${pkgver}-${CARCH}-unknown-linux-gnu"

  install -Dm755 "${_release_dir}/bin/sheprd" "${pkgdir}/usr/bin/sheprd"
  ln -sf sheprd "${pkgdir}/usr/bin/herdr-gpui"

  install -Dm644 "${_release_dir}/share/applications/org.sheprd.Sheprd.desktop" \
    "${pkgdir}/usr/share/applications/org.sheprd.Sheprd.desktop"
  install -Dm644 "${_release_dir}/share/icons/hicolor/scalable/apps/sheprd.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/sheprd.svg"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 "${_release_dir}/share/licenses/herdr-gpui/"* \
    "${pkgdir}/usr/share/licenses/${pkgname}/"
}
