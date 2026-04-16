# Maintainer: blitzkriegfc <blitzkriegfc@gmail.com>
pkgname=qbz-bin
pkgver=1.2.7
pkgrel=1
pkgdesc="Native Qobuz client for Linux with bit-perfect hi-res audio, DAC passthrough, Last.fm scrobbling, and Chromecast/DLNA casting"
arch=('x86_64' 'aarch64')
url="https://github.com/vicrodh/qbz"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'alsa-lib' 'libappindicator-gtk3' 'libxkbcommon' 'openssl')
optdepends=(
    'alsa-utils: Required for bit-perfect device detection and better ALSA device names'
    'pipewire-alsa: PipeWire audio support'
    'pipewire-pulse: PulseAudio compatibility'
)
provides=('qbz')
conflicts=('qbz')
options=('!strip')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/vicrodh/qbz/releases/download/v${pkgver}/qbz_${pkgver}_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/vicrodh/qbz/releases/download/v${pkgver}/qbz_${pkgver}_aarch64.tar.gz")
sha256sums_x86_64=('394d2d223a37a4f1dd1e406caf64f94d3e0aecdb297c1dba970dba84a20e2a28')
sha256sums_aarch64=('043d0e5c53938ef01f99977575a0156ffab23dc2b0222b2bf1c8483fa7badb6a')

package() {
    if [ "$CARCH" = "x86_64" ]; then
        _arch="amd64"
    elif [ "$CARCH" = "aarch64" ]; then
        _arch="aarch64"
    fi

    cd "${srcdir}/qbz_${pkgver}_${_arch}"

    # Install binary
    install -Dm755 "qbz" "${pkgdir}/usr/bin/qbz"

    # Install desktop file
    install -Dm644 "qbz.desktop" "${pkgdir}/usr/share/applications/qbz.desktop"

    # Install icons (freedesktop hicolor structure)
    install -Dm644 "icons/hicolor/32x32/apps/qbz.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/qbz.png"
    install -Dm644 "icons/hicolor/48x48/apps/qbz.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/qbz.png"
    install -Dm644 "icons/hicolor/64x64/apps/qbz.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/qbz.png"
    install -Dm644 "icons/hicolor/128x128/apps/qbz.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/qbz.png"
    install -Dm644 "icons/hicolor/256x256/apps/qbz.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/qbz.png"
}
