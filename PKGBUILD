# Maintainer: aik2 aik2mlj@gmail.com

pkgname='plugdata-bin'
_name='plugdata'
pkgdesc='Plugin wrapper around PureData with a new GUI made with JUCE, allowing patching in DAWs'
pkgver=0.7.0
pkgrel=3
groups=('lv2-plugins' 'vst3-plugins' 'clap-plugins' 'pro-audio')
depends=('freetype2' 'libx11' 'libxrandr' 'libxext' 'libxinerama' 'webkit2gtk' 'libxrender' 'libxinerama' 'libxcursor' 'alsa-lib' 'curl')
makedepends=()
optdepends=()
conflicts=('plugdata-git')
replaces=('plugdata-git')
arch=('x86_64' 'aarch64')
url='https://github.com/timothyschoen/PlugData'
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/timothyschoen/PlugData/releases/download/v${pkgver}/PlugData-Arch-x64.tar.gz")
sha512sums=('SKIP')


package () {
    # Desktop entry & pixmaps
    install -Dm644 "${srcdir}/../${_name}.desktop" "${pkgdir}/usr/share/applications/${_name}.desktop"
    install -Dm644 "${srcdir}/../${_name}.png" "${pkgdir}/usr/share/pixmaps/${_name}.png"

    mkdir -p "${pkgdir}/usr/lib/lv2/"
    find . -name '*.lv2' -type d -exec cp -ar {} "${pkgdir}/usr/lib/lv2/" \;
    mkdir -p "${pkgdir}/usr/lib/vst3/"
    find . -name '*.vst3' -type d -exec cp -ar {} "${pkgdir}/usr/lib/vst3/" \;
    mkdir -p "${pkgdir}/usr/lib/clap/"
    find . -name '*.clap' -type d -exec cp -ar {} "${pkgdir}/usr/lib/clap/" \;
    install -Dm755 -T ./plugdata/Standalone/* "${pkgdir}/usr/bin/${_name}"
}
