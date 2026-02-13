# Maintainer: blitzkriegfc <blitzkriegfc@proton.me>
pkgname=qbz-bin
pkgver=1.1.14
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
sha256sums_x86_64=('8bac22b7b9c43f83e8b8dfc7dfe39b92120bafe75224e51806559ba92de12a17')
sha256sums_aarch64=('a8d163eb32effc4e41d19d3dc4173a4e1aae475c742095517d4fefaeae93e96b')

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
