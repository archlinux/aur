# Maintainer: Yuzuki <lxf74663@gmail.com>

pkgname=qmtui-bin
_pkgname=qmtui
pkgver=0.3.6
pkgrel=1
pkgdesc="Linux terminal qqmusic player (.NET 10 Native AOT pre-built package)"
arch=('x86_64' 'aarch64')
url="https://github.com/Viemean/qmtui"
license=('MIT')
depends=(
    'gstreamer'
    'gst-plugins-base'
    'gst-plugins-good'
    'gst-plugins-bad'
    'libpulse'
)

optdepends=(
    'gst-libav: additional audio codecs (AAC/M4A) support'
    'wl-clipboard: Wayland clipboard support for copying song links'
    'xclip: X11 clipboard support for copying song links'
)

provides=('qmtui' 'qqmusic-tui' 'qmtui-bin')
conflicts=('qmtui' 'qqmusic-tui' 'qqmusic-tui-bin')
replaces=('qqmusic-tui' 'qqmusic-tui-bin')

source_x86_64=("${_pkgname}-${pkgver}-linux-x86_64.tar.gz::https://github.com/Viemean/qmtui/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-linux-aarch64.tar.gz::https://github.com/Viemean/qmtui/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-aarch64.tar.gz")
sha256sums_x86_64=('bab760fd015841171bd3658e2ee23a2618de7370838773627f5fe66059806a6b')
sha256sums_aarch64=('e490c5f031ab45259923ec91a1239a4555eeb5e5a0610106f357a3840f6c9742')

package() {
    install -Dm755 "${srcdir}/qmtui" "${pkgdir}/usr/bin/qmtui"
    ln -sf qmtui "${pkgdir}/usr/bin/qqmusic-tui"
    if [ -d "${srcdir}/www" ]; then
        install -dm755 "${pkgdir}/usr/share/qmtui/www"
        cp -a "${srcdir}/www/"* "${pkgdir}/usr/share/qmtui/www/"
    fi
    if [ -d "${srcdir}/qafp" ]; then
        install -dm755 "${pkgdir}/usr/share/qmtui"
        cp -a "${srcdir}/qafp" "${pkgdir}/usr/share/qmtui/"
    fi
}
