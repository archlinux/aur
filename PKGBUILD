# Maintainer: zaidejjo <zaid@ejjo.me>
# Contributor: zaidejjo <zaid@ejjo.me>
# shellcheck shell=bash

pkgname=zgit-desktop-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="A modern, fast Git & GitHub client — Desktop app (Wails)"
arch=('x86_64')
url="https://github.com/zaidejjo/zgit"
license=('Apache')
depends=('git' 'webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
makedepends=()
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=("${url}/releases/download/v${pkgver}/zgit-desktop-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('f812e258b5d0f79d6cfec866819ab7cac4f06d1cb2349d4d14f55f6347d30f9a')

package() {
  local _destdir="${pkgdir}/opt/zgit-desktop"
  install -d "${_destdir}"
  tar -xzf "${srcdir}/zgit-desktop-v${pkgver}-linux-amd64.tar.gz" -C "${_destdir}"

  # Binary
  install -Dm755 "${_destdir}/zgit-desktop" "${pkgdir}/usr/bin/zgit-desktop"

  # Desktop entry
  install -Dm644 "${srcdir}/zgit.desktop" "${pkgdir}/usr/share/applications/zgit.desktop"

  # Icon
  install -Dm644 "${_destdir}/zgit.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/zgit.png"

  # AppStream metadata
  install -Dm644 "${_destdir}/com.zaidejjo.zgit.metainfo.xml" \
    "${pkgdir}/usr/share/metainfo/com.zaidejjo.zgit.metainfo.xml"
}

# vim:set ts=2 sw=2 et:
