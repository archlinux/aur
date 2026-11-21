# Maintainer: Your Name <you@example.com>

pkgname=port-ex-machina-bin
pkgver=2026.11.20.0b062125
pkgrel=1
pkgdesc='Deus Ex source port with DXLauncher and DXEngine (prebuilt Linux release)'
arch=('x86_64')
url='https://github.com/JuggyMcNutty/port-ex-machina'
license=('Zlib')
depends=('glibc' 'libx11' 'libxi' 'libxext' 'dbus' 'glib2' 'fontconfig' 'freetype2' 'libglvnd')
optdepends=('pipewire: PipeWire audio output' 'libpulse: PulseAudio output')
provides=('port-ex-machina')
conflicts=('port-ex-machina')
options=('!strip')

_tag="${pkgver%.*}-${pkgver##*.}"
source=("DX-linux-x86_64-${_tag}.tar.gz::${url}/releases/download/${_tag}/DX-linux-x86_64.tar.gz"
        'port-ex-machina.sh'
        'port-ex-machina.desktop')
# Upstream's release-asset checksum must be obtained before AUR submission.
# Run updpkgsums after verifying the release archive. Never publish with SKIP.
sha256sums=('ebe93b0fb0937b687ef58444390da5a8eae886b173efa51479f5c235cf916b20'
            'e8b9608e93cbf2675b666a86ffb9bfbe9712291ddbdb8bce13ab0df770dcd78a'
            '15b9204aacef8b9806b3bd1d01a13a008e6f0df8b63e49ff5aece3c2f39a14e6')

package() {
  install -dm755 "${pkgdir}/opt/port-ex-machina" "${pkgdir}/usr/bin" \
    "${pkgdir}/usr/share/applications"

  # The archive contains DXLauncher (including its companion DXEngine).
  # Keep the upstream directory structure intact for relative resource paths.
  cp -a "${srcdir}/DXLauncher" "${pkgdir}/opt/port-ex-machina/"
  install -Dm755 "${srcdir}/port-ex-machina.sh" \
    "${pkgdir}/usr/bin/port-ex-machina"
  install -Dm644 "${srcdir}/port-ex-machina.desktop" \
    "${pkgdir}/usr/share/applications/port-ex-machina.desktop"
}
