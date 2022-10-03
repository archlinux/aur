# Maintainer: aik2 aik2mlj@gmail.com

pkgname='plugdata-bin'
_name='plugdata'
pkgdesc='Plugin wrapper around PureData with a new GUI made with JUCE, allowing patching in DAWs'
pkgver=0.6.1
pkgrel=1
groups=('vst-plugins' 'lv2-plugins' 'vst3-plugins' 'pro-audio')
depends=('freetype2' 'libx11' 'libxrandr' 'libxext' 'libxinerama' 'webkit2gtk' 'libxrender' 'libxinerama' 'libxcursor' 'alsa-lib' 'curl')
makedepends=()
optdepends=()
conflicts=('plugdata-git')
replaces=('plugdata-git')
arch=('x86_64' 'aarch64')
url='https://github.com/timothyschoen/PlugData'
license=('GPL3')
source=("https://github.com/timothyschoen/PlugData/releases/download/v${pkgver}/PlugData-Arch-x64.zip")
sha512sums=('SKIP')


package () {
    # Desktop entry & pixmaps
    install -Dm644 "${srcdir}/../${_name}.desktop" "${pkgdir}/usr/share/applications/${_name}.desktop"
    install -Dm644 "${srcdir}/../${_name}.png" "${pkgdir}/usr/share/pixmaps/${_name}.png"

    mkdir -p "${pkgdir}/usr/lib/lv2/"
    find ./LV2 -name '*.lv2' -type d -exec cp -ar {} "${pkgdir}/usr/lib/lv2/" \;
    mkdir -p "${pkgdir}/usr/lib/vst3/"
    find ./VST3 -name '*.vst3' -type d -exec cp -ar {} "${pkgdir}/usr/lib/vst3/" \;
    install -Dm755 -T ./Standalone/* "${pkgdir}/usr/bin/${_name}"
}
