# Maintainer: Harsh Narayan Jha <harshnj dot proton dot me>

pkgname=ffstudio-bin
pkgver=0.2.7
pkgrel=1
pkgdesc="Node-based FFmpeg frontend"
arch=('x86_64')
url="https://github.com/Draver93/ff-studio"
license=('GPL3')
depends=('ffmpeg' 'webkit2gtk-4.1' 'gtk3' 'hicolor-icon-theme')
provides=('ffstudio')
conflicts=('ffstudio')
options=(!debug)
source=("${url}/releases/download/v${pkgver}/FFStudio_${pkgver}_amd64.deb")
sha256sums=('4b5094c07cf531adc5e3d26382be48f35baa2881c9d213ccbffdb39ae5acb883')
_pkgdesktop="FFStudio.desktop"


prepare() {
  tar -xf data.tar.gz
}

package() {
  # Desktop file
  install -Dm644 "${srcdir}/usr/share/applications/${_pkgdesktop}" "${pkgdir}/usr/share/applications/${_pkgdesktop}"

  # Icons
  install -dm644 "${pkgdir}/usr/share/icons"
  cp -a "${srcdir}/usr/share/icons" "${pkgdir}/usr/share"

  # Binary
  install -dm755 "${pkgdir}/usr/bin"
  install -m755 "${srcdir}/usr/bin/ffstudio" "${pkgdir}/usr/bin"
}
