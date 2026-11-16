# Maintainer: Sam Whited <sam@samwhited.com>
# Contributor: Andrej Radović <r.andrej@gmail.com>

pkgbase=zl-equalizer-bin
pkgname=('zl-equalizer-vst3-bin' 'zl-equalizer-lv2-bin' 'zl-equalizer-standalone-bin' 'zl-equalizer-bin')
_pkgname=ZLEqualizer
pkgver=1.4.2
pkgrel=1
pkgdesc="Advanced parametric equalizer audio plugin by ZL-Audio, including dynamic EQ"
arch=('x86_64' 'aarch64')
url="https://github.com/ZL-Audio/ZLEqualizer"
license=('AGPL-3.0-only')
groups=('zl-audio' 'pro-audio')
depends=(
  'expat'
  'freetype2'
  'fontconfig'
  'nlopt'
  'highway'
  'zlib'
  'bzip2'
  'libpng'
  'brotli'
  'alsa-lib'
)
provides=('zlequalizer')
conflicts=('zlequalizer')
options=(!strip)

source=("https://raw.githubusercontent.com/ZL-Audio/ZLEqualizer/refs/tags/${pkgver}/LICENSE.md")
source_x86_64=("https://github.com/ZL-Audio/ZLEqualizer/releases/download/${pkgver}/ZL.Equalizer.2-${pkgver}-Linux-x86-64-AVX2.zip")
source_aarch64=("https://github.com/ZL-Audio/ZLEqualizer/releases/download/${pkgver}/ZL.Equalizer.2-${pkgver}-Linux-arm64.zip")
sha256sums=('a96fd9920a72e79720d41bcf32ccd58634194aa01ee82f246a72392015d626e9')
sha256sums_x86_64=('d7b71c0b8084b518a84217ea8acf0388fd422965c3b1953b483a5b12e4a3ac4d')
sha256sums_aarch64=('94e8287fc7817f30bd14772b289bada45a1c7fe4c73028eeb31f7a520e4304c3')

package_zl-equalizer-vst3-bin() {
  groups+=('vst3-plugins')
  pkgdesc+=' (VST3 version)'
  install -dm755 "${pkgdir}/usr/lib/vst3"
  cp -a "${srcdir}/VST3/ZL Equalizer 2.vst3" "${pkgdir}/usr/lib/vst3/ZLEqualizer2.vst3"
  install -Dm644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_zl-equalizer-lv2-bin() {
  groups+=('lv2-plugins')
  pkgdesc+=' (LV2 version)'
  install -dm755 "${pkgdir}/usr/lib/lv2"
  cp -a "${srcdir}/LV2/ZL Equalizer 2.lv2" "${pkgdir}/usr/lib/lv2/ZLEqualizer2.lv2"
  install -Dm644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}

package_zl-equalizer-standalone-bin() {
  # TODO: add a .desktop file and copy over the icon to the correct place. Also,
  # I made this group up, is there an actual group standalone plugins should
  # use?
  groups+=('pipewire-plugins')
  pkgdesc+=' (standalone version)'
  install -Dm755 "${srcdir}/Standalone/ZL Equalizer 2" "${pkgdir}/usr/bin/zlequalizer"
  install -Dm644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_zl-equalizer-bin() {
  pkgdesc+=' (metapackage that requires all plugin formats)'
  depends+=('zl-equalizer-vst3-bin' 'zl-equalizer-lv2-bin' 'zl-equalizer-standalone-bin')
}

# vim:set ts=2 sw=2 et:
