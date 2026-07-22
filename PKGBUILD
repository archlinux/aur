# Maintainer: marcomorosi06 <marcomorosi.dev@gmail.com>
pkgname=wifi-audio-streaming-desktop
pkgver=1.1.0
pkgrel=1
pkgdesc="Share your desktop audio in your LAN via WiFi"
arch=('x86_64')
url="https://github.com/marcomorosi06/WiFiAudioStreaming-Desktop"
license=('EUPL-1.2')
depends=('glibc' 'alsa-lib' 'libpulse')
source=("https://github.com/marcomorosi06/WiFiAudioStreaming-Desktop/releases/download/v1.1/WiFi-Audio-Streaming-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('9e973ba73d2e0776bb1c408c19629a8660572898e89a3a4611290b145546425e')

package() {
    mkdir -p "${pkgdir}/opt/${pkgname}"
    mkdir -p "${pkgdir}/usr/bin"

    # v1.1 tarball extracts straight to "WiFi Audio Streaming/" (no "app/" wrapper like v1.0 had)
    cp -r "${srcdir}/WiFi Audio Streaming" "${pkgdir}/opt/${pkgname}/"

    # GUI launcher
    ln -s "/opt/${pkgname}/WiFi Audio Streaming/bin/WiFi Audio Streaming" "${pkgdir}/usr/bin/${pkgname}"

    # wfas CLI: same binary, invoked with CLI args (--server, --client, control, config, ...)
    ln -s "/opt/${pkgname}/WiFi Audio Streaming/bin/WiFi Audio Streaming" "${pkgdir}/usr/bin/wfas"

    mkdir -p "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/${pkgname}.desktop" << DESKTOP
[Desktop Entry]
Name=WiFi Audio Streaming
Exec=${pkgname}
Type=Application
Categories=Audio;Network;
DESKTOP
}
