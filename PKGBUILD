# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=inner-pitch
pkgname=inner-pitch-bin
pkgver=2.1
pkgrel=1
pkgdesc="A pitch shifter plugin (LV2, CLAP, VST3), free edition"
arch=('x86_64')
url="https://www.auburnsounds.com/products/Inner-Pitch"
license=('LicenseRef-proprietary')
groups=('pro-audio' 'lv2-plugins' 'vst3-plugins' 'clap-plugins')
depends=('libgcc' 'libx11')
provides=('inner-pitch')
conflicts=('inner-pitch')
options=('!strip' '!debug')
source=("Inner-Pitch-FREE-${pkgver}.zip::https://www.auburnsounds.com/downloads/Inner-Pitch-FREE-${pkgver}.zip")
sha256sums=('eedbb307954ec38f87575d1e1807259645107d830779c3727aa9129465691fec')

package() {
  local _srcdir="${srcdir}/Inner-Pitch-FREE-${pkgver}/Linux"

  # Install LV2 plugins
  install -dm755 "${pkgdir}/usr/lib/lv2"
  cp -a "${_srcdir}/Linux-64b-LV2-FREE/"* "${pkgdir}/usr/lib/lv2/"

  # Install VST3 plugins
  install -dm755 "${pkgdir}/usr/lib/vst3"
  cp -a "${_srcdir}/Linux-64b-VST3-FREE/"* "${pkgdir}/usr/lib/vst3/"

  # Install CLAP plugins
  install -dm755 "${pkgdir}/usr/lib/clap"
  install -m755 "${_srcdir}/Linux-64b-CLAP-FREE/"*.clap "${pkgdir}/usr/lib/clap/"

  # Install documentation
  install -dm755 "${pkgdir}/usr/share/doc/${_pkgname}"
  install -m644 "${srcdir}/Inner-Pitch-FREE-${pkgver}"/*.pdf "${pkgdir}/usr/share/doc/${_pkgname}/"
  install -m644 "${srcdir}/Inner-Pitch-FREE-${pkgver}"/*.jpg "${pkgdir}/usr/share/doc/${_pkgname}/"

  # Install license
  install -Dm644 "${srcdir}/Inner-Pitch-FREE-${pkgver}/license.html" "${pkgdir}/usr/share/licenses/${pkgname}/license.html"
}
