# Maintainer: Andrej Radović <r.andrej@gmail.com>
#
pkgname=zl-equalizer-bin
_pkgname=ZLEqualizer
pkgver=0.6.1
pkgrel=1
pkgdesc="Advanced parametric equalizer audio plugin by ZL-Audio, including dynamic EQ"
arch=('x86_64' 'aarch64')
url="https://github.com/ZL-Audio/ZLEqualizer"
license=('AGPL3')
depends=('gcc-libs' 'glibc')
provides=('zlequalizer')
conflicts=('zlequalizer')
options=(!strip)

source=("license-${pkgver}.md::https://raw.githubusercontent.com/ZL-Audio/ZLEqualizer/refs/tags/${pkgver}/LICENSE.md")
source_x86_64=("${_pkgname}-${pkgver}-Linux.zip::https://github.com/ZL-Audio/ZLEqualizer/releases/download/${pkgver}/ZL.Equalizer-${pkgver}-Linux.zip")
source_aarch64=("${_pkgname}-${pkgver}-Linux-ARM64.zip::https://github.com/ZL-Audio/ZLEqualizer/releases/download/${pkgver}/ZL.Equalizer-${pkgver}-Linux-ARM64.zip")
sha256sums=('a96fd9920a72e79720d41bcf32ccd58634194aa01ee82f246a72392015d626e9')
sha256sums_x86_64=('44f25785766141ecedf35f4771c76569a24dfedf347821113d2ba868deb1a9fe')
sha256sums_aarch64=('c7119954de424d26a8acb6a4dd902d6cffa4bd12a0d62492bfc62e3b643124c6')

package() {
    # Create directories
    install -dm755 "${pkgdir}/usr/lib/vst3"
    install -dm755 "${pkgdir}/usr/lib/lv2"
    install -dm755 "${pkgdir}/usr/lib/clap"

    # Install VST3 plugin
    cp -a "${srcdir}/VST3/ZL Equalizer.vst3" "${pkgdir}/usr/lib/vst3/ZLEqualizer.vst3"

    # Install LV2 plugin if available
    cp -a "${srcdir}/LV2/ZL Equalizer.lv2" "${pkgdir}/usr/lib/lv2/ZLEqualizer.lv2"

    # Install Standalone version if available
    install -Dm755 "${srcdir}/Standalone/ZL Equalizer" "${pkgdir}/usr/bin/zlequalizer"

    # Install license
    install -Dm644 "${srcdir}/license-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
