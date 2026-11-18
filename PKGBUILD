#!/usr/bin/env bash
# shellcheck disable=SC2034
# Maintainer: Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=sheprd-bin
pkgver=20261118.1
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
sha256sums_x86_64=('f4490d33502e088555b16689de502eb7e26c240dc9a97a7cf3610238a46acb58')
sha256sums_aarch64=('aedd45c4eee205f8d0835edea149227293e567abe50814709c25aee03a6c782a')

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
