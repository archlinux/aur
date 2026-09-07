# Maintainer: axel10 <https://github.com/axel10/vynody>
pkgname=vynody-bin
_pkgname=vynody
pkgver=2.4.1
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
sha256sums_x86_64=('6ac788d57ce83c0456a3038ab5a77e88623b355b9f6e2c812658088e87e071d5')

package() {
  local data_archive
  data_archive=$(find "${srcdir}" -maxdepth 1 -name "data.tar.*" | head -n 1)
  if [[ -n "$data_archive" ]]; then
    bsdtar -xf "${data_archive}" -C "${pkgdir}"
  else
    bsdtar -xf "${pkgname}-${pkgver}.deb" -C "${pkgdir}"
  fi
}
