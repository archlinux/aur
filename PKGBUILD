# Maintainer: Harrison <htv04rules at gmail dot com>

_pkgname="melonds"
pkgname="${_pkgname}-bin"
pkgver=0.9.4
pkgrel=1
pkgdesc="DS emulator, sorta"
arch=("x86_64" "aarch64")
url="http://melonds.kuribo64.net"
license=("GPL3")
depends=("libepoxy" "libslirp" "qt5-base" "sdl2")
makedepends=("git")
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${_pkgname}-git::git+https://github.com/Arisotura/melonDS.git#tag=${pkgver}")
sha256sums=("SKIP")

source_x86_64=("${url}/downloads/melonDS_${pkgver}_linux_x64.7z")
sha256sums_x86_64=("b1a8a1759acce339ec76591ad7d917e18dc932b6bd4b44fd3a4cf783b13d6f36")

source_aarch64=("${url}/downloads/melonDS_${pkgver}_linux_arm64.7z")
sha256sums_aarch64=("b5239d1fd729f5c0293e49ac9abc1026549edc0bc8d3ecfffe25143bdc51bf0d")

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
