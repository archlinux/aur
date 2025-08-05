# Maintainer: hcorion <zionnimchuk@gmail.com>
# Contributor: Harrison <htv04rules at gmail dot com>

_pkgname="melonds"
pkgname="${_pkgname}-bin"
pkgver=1.0
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
sha256sums=("414b376e14a66d8e095605b83a6b7711c04330be159b2649c87213fe8af0c9c6")

source_x86_64=("https://github.com/melonDS-emu/melonDS/releases/download/${pkgver}/melonDS-ubuntu-x86_64.zip")
sha256sums_x86_64=("1f6187a69a34261a8aa28ca0758493e89f0969f70ff14a38d0b861c8dc236160")

source_aarch64=("https://github.com/melonDS-emu/melonDS/releases/download/${pkgver}/melonDS-ubuntu-aarch64.zip")
sha256sums_aarch64=("6d385cf5e8c5d508a7dc1fc327649227fde06f781daa7ea158bd897c35461340")

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
