# Maintainer: Yuzuki <lxf74663@gmail.com>

pkgname=qmtui-bin
_pkgname=qmtui
pkgver=0.5.2
pkgrel=1
pkgdesc="Linux terminal qqmusic player (.NET 10 Native AOT pre-built package)"
arch=('x86_64' 'aarch64')
url="https://github.com/Viemean/qmtui"
license=('MIT')
depends=(
    'gstreamer'
    'gst-plugins-base'
    'gst-plugins-good'
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
sha256sums_x86_64=('5e1b46d53df42ee6790e698e442842ee7e1ae154d2116a89969790e6c4bd007d')
sha256sums_aarch64=('83f6f7f754c2060c0040075478eb2c2215d85a62e7750c3f9a23f1ceae18e0c2')

package() {
    install -Dm755 "${srcdir}/qmtui" "${pkgdir}/usr/bin/qmtui"
    ln -sf qmtui "${pkgdir}/usr/bin/qqmusic-tui"
    if [ -d "${srcdir}/www" ]; then
        install -dm755 "${pkgdir}/usr/share/qmtui/www"
        cp -a "${srcdir}/www/"* "${pkgdir}/usr/share/qmtui/www/"
    fi
}
