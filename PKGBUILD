#!/usr/bin/env bash
# shellcheck disable=SC2034
# Maintainer: Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=sheprd-bin
pkgver=20261108.1
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
sha256sums_x86_64=('b63db5b7eca365b32d39c9947906869840d1bd79206c5ae9cbdf80605956c609')
sha256sums_aarch64=('8fc57c59b9743c2a1c5b7b48cb9c35b37dd1fc255da58124441dbfbfff213e00')

source_aarch64=(
  "Sheprd-${pkgver}-aarch64-unknown-linux-gnu.tar.gz::https://github.com/sheprd-labs/sheprd/releases/download/v${pkgver}/Sheprd-${pkgver}-aarch64-unknown-linux-gnu.tar.gz"
)

package() {
  local _release_dir="${srcdir}/Sheprd-${pkgver}-${CARCH}-unknown-linux-gnu"

  install -Dm755 "${_release_dir}/bin/sheprd" "${pkgdir}/usr/bin/sheprd"
  ln -sf sheprd "${pkgdir}/usr/bin/herdr-gpui"

  install -Dm644 "${_release_dir}/share/applications/so.pen.herdr-gpui.desktop" \
    "${pkgdir}/usr/share/applications/so.pen.herdr-gpui.desktop"
  install -Dm644 "${_release_dir}/share/icons/hicolor/scalable/apps/sheprd.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/sheprd.svg"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 "${_release_dir}/share/licenses/herdr-gpui/"* \
    "${pkgdir}/usr/share/licenses/${pkgname}/"
}
