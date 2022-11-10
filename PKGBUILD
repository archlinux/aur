# Maintainer: Harrison <htv04rules at gmail dot com>

_pkgname="melonds"
pkgname="${_pkgname}-bin"
pkgver=0.9.5
pkgrel=1
pkgdesc="DS emulator, sorta"
arch=("x86_64" "aarch64")
url="http://melonds.kuribo64.net"
license=("GPL3")
depends=("libepoxy" "libslirp" "qt5-base" "qt5-multimedia" "sdl2")
makedepends=("git")
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${_pkgname}-git::git+https://github.com/Arisotura/melonDS.git#tag=${pkgver}")
sha256sums=("SKIP")

source_x86_64=("${url}/downloads/melonDS_${pkgver}_linux_x64.zip")
sha256sums_x86_64=("67eb30acb1bb33a36ad9ea3d025a4666cc188ee51c5289857e940f3892efe84d")

source_aarch64=("${url}/downloads/melonDS_${pkgver}_linux_arm64.zip")
sha256sums_aarch64=("1747bd4d34bae7ecd2fdb15b4f7458d991dd0bd9bf014de6fea8ded4b12664d7")

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
