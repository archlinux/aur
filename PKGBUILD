# Maintainer: hcorion <zionnimchuk@gmail.com>
# Contributor: Harrison <htv04rules at gmail dot com>

_pkgname="melonds"
pkgname="${_pkgname}-bin"
pkgver=1.1
pkgrel=1
pkgdesc="DS emulator, sorta"
arch=("x86_64" "aarch64")
url="http://melonds.kuribo64.net"
license=("GPL-3.0-or-later")
depends=("qt6-base" "qt6-multimedia" "qt6-svg" "sdl2" "enet" "libx11" "libglvnd" "hicolor-icon-theme")
makedepends=("git")
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${_pkgname}-git::git+https://github.com/Arisotura/melonDS.git#tag=${pkgver}")
sha256sums=("f40db55b2a58173e1829a27e2f49c68440115eebcd48ed19a5d45d6bfa4bc717")

source_x86_64=("https://github.com/melonDS-emu/melonDS/releases/download/${pkgver}/melonDS-${pkgver}-ubuntu-x86_64.zip")
sha256sums_x86_64=("99465129f5413b2aad332e4377e523cf3cda905dc329d47dcb1ad01ce2cb3f66")

source_aarch64=("https://github.com/melonDS-emu/melonDS/releases/download/${pkgver}/melonDS-${pgver}-ubuntu-aarch64.zip")
sha256sums_aarch64=("43bd28d9e6e864f08747905c9cbdeac701880d75f2dedad737279c7a005790f4")

package() {
  cd "${srcdir}"

  # Install binary
  install -Dm0755 melonDS "${pkgdir}/usr/bin/melonDS"

  # Install icons
  for size in 16 32 64 128 256; do
    install -Dm0644 ${_pkgname}-git/res/icon/melon_${size}x${size}.png "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/net.kuribo64.melonDS.png"
  done

  # Install desktop entry
  install -Dm0644 ${_pkgname}-git/res/net.kuribo64.melonDS.desktop "${pkgdir}/usr/share/applications/net.kuribo64.melonDS.desktop"
}
