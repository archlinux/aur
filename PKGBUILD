# Maintainer: Yuzuki <lxf74663@gmail.com>

pkgname=qmtui-bin
_pkgname=qmtui
pkgver=0.3.8
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
sha256sums_x86_64=('8fa03dacc82743bfbae18fb93c074183af4e008210218f1a82a36ce7cb1cf841')
sha256sums_aarch64=('06db0ddef12818793b5221e11ed9303824b3c248c4124fd0631a7811f622fb1f')

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
