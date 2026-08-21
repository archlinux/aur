# Maintainer: marcomorosi06 <marcomorosi.dev@gmail.com>
pkgname=wifi-audio-streaming-desktop
pkgver=1.2.0
pkgrel=1
pkgdesc="Share your desktop audio in your LAN via WiFi"
arch=('x86_64')
url="https://github.com/marcomorosi06/WiFiAudioStreaming-Desktop"
license=('EUPL-1.2')
depends=('glibc' 'alsa-lib' 'libpulse')
source=("https://github.com/marcomorosi06/WiFiAudioStreaming-Desktop/releases/download/v1.2/WiFi-Audio-Streaming-1.2.0-linux-x86_64.tar.gz")
sha256sums=('958abad66111e798dbefe9c7672758b78c5fa6e0138e4b74fc8271541852b604')

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
