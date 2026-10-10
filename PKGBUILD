# Maintainer: Sam Whited <sam@samwhited.com>

pkgbase='zl-speceq-bin'
pkgname=('zl-speceq-vst3-bin' 'zl-speceq-lv2-bin' 'zl-speceq-bin')
pkgver='0.1.1'
pkgrel=1
pkgdesc='Dynamic spectrum equalizer audio plugin'
arch=('x86_64' 'aarch64')
url='https://zl-audio.github.io/plugins/zlspeceq/'
license=('AGPL-3.0-only')
groups=('pro-audio' 'zl-audio')
depends=(
  'alsa-lib'
  'libx11'
  'libxcomposite'
  'libxcursor'
  'libxext'
  'libxinerama'
  'libxrandr'
  'libxrender'
  'freetype2'
  'fontconfig'
  'libxi'
)

source_x86_64=("https://github.com/ZL-Audio/ZLSpectrumEqualizer/releases/download/${pkgver}/ZL.Spectrum.Equalizer-${pkgver}-Linux-x86-64-AVX2.zip")
source_aarch64=("https://github.com/ZL-Audio/ZLSpectrumEqualizer/releases/download/${pkgver}/ZL.Spectrum.Equalizer-${pkgver}-Linux-arm64.zip")
sha256sums_x86_64=('55b7d92cf5e2a380dda2111b805aeab694389fdefeefe8458f924530d8c8d5c6')
sha256sums_aarch64=('b0ae49ddfb1b17bdf904bd9f4000562590d2ab523010551fd78e512254a101a6')

package_zl-speceq-vst3-bin() {
  groups+=('vst3-plugins')
  pkgdesc+=' (VST3 version)'
  mkdir -p "${pkgdir}/usr/lib/vst3/"
  cp -r "${srcdir}"/VST3/* "${pkgdir}/usr/lib/vst3"
}

package_zl-speceq-lv2-bin() {
  groups+=('lv2-plugins')
  pkgdesc+=' (LV2 version)'
  mkdir -p "${pkgdir}/usr/lib/lv2/"
  cp -r "${srcdir}"/LV2/* "${pkgdir}/usr/lib/lv2"
}

package_zl-speceq-bin() {
  pkgdesc+=' (metapackage that requires all plugin formats)'
  depends+=('zl-speceq-vst3-bin' 'zl-speceq-lv2-bin')
}

# vim:set ts=2 sw=2 et:
