# Maintainer: Yuzuki <lxf74663@gmail.com>

pkgname=qmtui-bin
_pkgname=qmtui
pkgver=0.5.4
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
sha256sums_x86_64=('002fb6b5fe77b8b20429fb17f51962c0f8544400b37a74e649c9dc9af2100953')
sha256sums_aarch64=('9d6fff1740213e057ffe3b3b2c4bacd075091887cae1d72873992f975b8ba715')

package() {
    install -Dm755 "${srcdir}/qmtui" "${pkgdir}/usr/bin/qmtui"
    ln -sf qmtui "${pkgdir}/usr/bin/qqmusic-tui"
    if [ -d "${srcdir}/www" ]; then
        install -dm755 "${pkgdir}/usr/share/qmtui/www"
        cp -a "${srcdir}/www/"* "${pkgdir}/usr/share/qmtui/www/"
    fi
}
