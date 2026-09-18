# Maintainer: Álvaro De Quinta <blackcherry at danwin1210 dot de>

_pkgname='proton-rtsp-wayland-ge'
pkgname="${_pkgname}-bin"
pkgdesc='Latest Proton with the Proton-RTSP and Wayland GE patchset, for VRChat livestream (RTSP/VRCDN) playback'
_betaver='4'
_pkgfolder="Proton-RTSP-Wayland-GE-Beta${_betaver}"
_pkgver="11.1.0-beta.${_betaver}"
pkgver=${_pkgver//-/.}
pkgrel='1'
arch=('x86_64')
url='https://github.com/Go08er/Proton-RTSP-Wayland-GE'
license=('BSD' 'LGPL' 'zlib' 'MIT' 'MPL' 'custom')
depends=('sed')
conflicts=("${_pkgname}")
provides=('proton' "${_pkgname}")
options=(!strip emptydirs)
source=("${url}/releases/download/v${_pkgver}/${_pkgname}-beta${_betaver}.tar.gz")
sha256sums=('3cea2cf5f4766b47f74396cbb4d5c6dcf7534dc364d8a18c6e8178383805d849')

build() {
  sed -i -r 's|"Proton.*"|"Proton-RTSP-Wayland-GE"|' ${_pkgfolder}/compatibilitytool.vdf
}

package() {
  install -d "${pkgdir}/usr/share/steam/compatibilitytools.d/${_pkgname}"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"

  ## licenses
  mv ${_pkgfolder}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/license"
  mv ${_pkgfolder}/LICENSE.OFL "${pkgdir}/usr/share/licenses/${pkgname}/license_OFL"
  mv ${_pkgfolder}/PATENTS.AV1 "${pkgdir}/usr/share/licenses/${pkgname}/license_AV1"

  ## the build itself
  mv ${_pkgfolder}/* "${pkgdir}/usr/share/steam/compatibilitytools.d/${_pkgname}/"
}
