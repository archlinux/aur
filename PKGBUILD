# Maintainer: axel10 <https://github.com/axel10/vynody>
pkgname=vynody-bin
_pkgname=vynody
pkgver=2.23.6
pkgrel=1
pkgdesc="Cross-platform local music/audio player with synced lyrics and audio tag editor"
arch=('x86_64')
url="https://github.com/axel10/vynody"
license=('GPL-3.0-or-later')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'fontconfig'
  'freetype2'
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'libepoxy'
  'pango'
  'hicolor-icon-theme'
)
optdepends=(
  'ffmpeg: Audio decoding support'
)
options=('!strip')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source_x86_64=("${pkgname}-${pkgver}.deb::${url}/releases/download/${pkgver}/${_pkgname}-linux-${pkgver}-amd64.deb")
sha256sums_x86_64=('db2f015a509ea05064d836ab4a4381adb7d3ec9e0dd522ee573d6374fa2ea2ef')

package() {
  local data_archive
  data_archive=$(find "${srcdir}" -maxdepth 1 -name "data.tar.*" | head -n 1)
  if [[ -n "$data_archive" ]]; then
    bsdtar -xf "${data_archive}" -C "${pkgdir}"
  else
    bsdtar -xf "${pkgname}-${pkgver}.deb" -C "${pkgdir}"
  fi
}
