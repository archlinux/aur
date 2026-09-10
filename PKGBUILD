# Maintainer: Álvaro De Quinta <blackcherry at danwin1210 dot de>

_pkgname='proton-cachyos-rtsp'
pkgname="${_pkgname}-slr-bin"
pkgdesc='CachyOS Proton with the Proton-RTSP patchset, for VRChat livestream (RTSP/VRCDN) playback. Package for steam with less dependencies'
_pkgver='11.0-20260703'
pkgver=${_pkgver//-/.}
pkgrel='1'
arch=('x86_64')
url='https://github.com/wundervrc/proton-cachyos-rtsp'
license=('BSD' 'LGPL' 'zlib' 'MIT' 'MPL' 'custom')
depends=('tar' 'sed')
conflicts=("${_pkgname}")
provides=('proton' "${_pkgname}")
options=(!strip emptydirs)
source=("${url}/releases/download/${_pkgname}-${_pkgver}-${pkgrel}/${_pkgname}-${_pkgver}-${pkgrel}.tar.xz")
sha256sums=('e5a314d3fa6cf058d7f5234fe7899891be4d04e955449cd6628d041aace9a431')

build() {
  sed -i -r 's|"proton.*"|"Proton-CachyOS-RTSP"|' "${_pkgname}-${_pkgver}-${pkgrel}"/compatibilitytool.vdf
}

package() {
  install -d "${pkgdir}/usr/share/steam/compatibilitytools.d/${_pkgname}"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"

  ## licenses
  mv "${_pkgname}-${_pkgver}-${pkgrel}/LICENSE"      "${pkgdir}/usr/share/licenses/${pkgname}/license"
  mv "${_pkgname}-${_pkgver}-${pkgrel}/LICENSE.OFL"  "${pkgdir}/usr/share/licenses/${pkgname}/license_OFL"
  mv "${_pkgname}-${_pkgver}-${pkgrel}/PATENTS.AV1"  "${pkgdir}/usr/share/licenses/${pkgname}/license_AV1"

  ## the build itself
  mv "${_pkgname}-${_pkgver}-${pkgrel}"/* "${pkgdir}/usr/share/steam/compatibilitytools.d/${_pkgname}/"
}
