# Maintainer: Kingkor Roy Tirtho <krtirho@gmail.com>
pkgname=spotube-bin
pkgver=6.0.0
pkgrel=1
pkgdesc="Open source, plugin powered music streaming client"
arch=(x86_64 aarch64)
url="https://spotube.cc"
license=('AGPL-3.0-or-later')
# libvlc + plugins for playback (FFmpeg demux/decode, GnuTLS for HTTPS streams, PulseAudio/PipeWire output),
# WebKitGTK 4.1 for the webview, and the X11/GL/ALSA libraries the AWT/Skiko natives link
depends=(
  'libvlc' 'vlc-plugins-base' 'vlc-plugin-ffmpeg' 'vlc-plugin-gnutls' 'vlc-plugin-pulse'
  'webkit2gtk-4.1' 'gtk3' 'glib2' 'dbus' 'alsa-lib' 'libglvnd' 'fontconfig' 'freetype2'
  'libx11' 'libxext' 'libxi' 'libxrender' 'libxtst' 'zlib'
)
provides=('spotube')
conflicts=('spotube')
options=('!strip' '!debug')
source_x86_64=("https://github.com/team-spotube/spotube/releases/download/v${pkgver}/spotube-linux-${pkgver}-x86_64.tar.xz")
source_aarch64=("https://github.com/team-spotube/spotube/releases/download/v${pkgver}/spotube-linux-${pkgver}-aarch64.tar.xz")
sha256sums_x86_64=('460ef44cf50de638e8ecdaf5a7fad1bc7f81cf2dd276d8794eea341726595e7d')
sha256sums_aarch64=('7525d019e67fce222ae2bb3aec34c8764dcd7569e6df0740e15dc6b9641ced77')

package() {
  cd "spotube-linux-${pkgver}-${CARCH}"

  install -dm755 "${pkgdir}/opt" "${pkgdir}/usr/bin" "${pkgdir}/usr/share"
  cp -a app "${pkgdir}/opt/spotube"
  cp -a share/. "${pkgdir}/usr/share/"
  ln -s /opt/spotube/spotube "${pkgdir}/usr/bin/spotube"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
