# Maintainer: blitzkriegfc <blitzkriegfc@gmail.com>
pkgname=qbz-bin
pkgver=2.0.2
pkgrel=1
pkgdesc="Native Qobuz client for Linux with bit-perfect hi-res audio, DAC passthrough, Last.fm scrobbling, and Chromecast/DLNA casting"
arch=('x86_64' 'aarch64')
url="https://github.com/vicrodh/qbz"
license=('MIT')
# v2.0+ (Slint/winit binary): no webkit/gtk/appindicator — the measured
# runtime link set is alsa/fontconfig/freetype/png/bz2/expat/zlib, plus the
# wayland/x11/GL/dbus/xkbcommon stack dlopen'd by winit/wgpu.
depends=('alsa-lib' 'fontconfig' 'freetype2' 'libpng' 'bzip2' 'expat' 'zlib'
         'libxkbcommon' 'wayland' 'libglvnd' 'dbus')
optdepends=(
    'alsa-utils: Required for bit-perfect device detection and better ALSA device names'
    'pipewire-alsa: PipeWire audio support'
    'pipewire-pulse: PulseAudio compatibility'
    'vulkan-driver: GPU-accelerated rendering (wgpu)'
)
provides=('qbz')
conflicts=('qbz')
options=('!strip')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/vicrodh/qbz/releases/download/v${pkgver}/qbz_${pkgver}_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/vicrodh/qbz/releases/download/v${pkgver}/qbz_${pkgver}_aarch64.tar.gz")
sha256sums_x86_64=('6e0f9e9696a952d566a56328799a2f0f951e0b6e3b1f47ba3c016f92622bea4b')
sha256sums_aarch64=('13e79cc4935be490be2364d4e91cdc2e86def0f640f2979ef51ba5ae3e2f5531')

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
