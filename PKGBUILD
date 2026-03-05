# Maintainer: Lejun Min <code at lejun dot site>

pkgname='plugdata-bin'
_name='plugdata'
pkgdesc='Plugin wrapper around Pure Data with a new JUCE GUI, allowing patching in DAWs'
pkgver=0.9.3_1
pkgrel=3
groups=('lv2-plugins' 'vst3-plugins' 'clap-plugins' 'pro-audio')
depends=('freetype2' 'libx11' 'libxrandr' 'libxext' 'libxinerama' 'webkit2gtk' 'libxrender' 'libxinerama' 'libxcursor' 'alsa-lib' 'curl')
makedepends=()
optdepends=()
provides=($_name)
conflicts=($_name)
arch=('x86_64' 'aarch64')
url='https://github.com/plugdata-team/plugdata'
license=('GPL3')
source=("${_name}.desktop" "${_name}.png")
source_x86_64=("https://github.com/plugdata-team/plugdata/releases/download/v${pkgver/_/-}/plugdata-Arch-x64.tar.xz")
source_aarch64=("https://github.com/plugdata-team/plugdata/releases/download/v${pkgver/_/-}/plugdata-Arch-aarch64.tar.xz")
sha256sums=('22cdffc139b070f9c1ada241068eef8d88c5b25fc16c4a2cd67582660c98e922'
            '6e583e7cf952a3b5a587ff85567406c9f3cb0d3516494368b89bc7af6871f869')
sha256sums_x86_64=('baa17fb8fe43071af8ec5454a82992afc040258fdbb1e581bfc8efbde3bfbe44')
sha256sums_aarch64=('d6e6b485fcce12fa62e846775213023223df5196525becc1a3d6f978a9f346b0')

package() {
    # Desktop entry & pixmaps
    install -Dm644 "${_name}.desktop" "${pkgdir}/usr/share/applications/${_name}.desktop"
    install -Dm644 "${_name}.png" "${pkgdir}/usr/share/pixmaps/${_name}.png"

    mkdir -p "${pkgdir}/usr/lib/lv2/"
    find . -name '*.lv2' -type d -exec cp -ar {} "${pkgdir}/usr/lib/lv2/" \;
    mkdir -p "${pkgdir}/usr/lib/vst3/"
    find . -name '*.vst3' -type d -exec cp -ar {} "${pkgdir}/usr/lib/vst3/" \;
    mkdir -p "${pkgdir}/usr/lib/clap/"
    find . -name '*.clap' -type f -exec cp -ar {} "${pkgdir}/usr/lib/clap/" \;
    install -Dm755 -T ./plugdata/Standalone/* "${pkgdir}/usr/bin/${_name}"
}
