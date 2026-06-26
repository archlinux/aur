# Maintainer: robertfoster
pkgname=stremio-server-go-bin
pkgver=0.2.0 # renovate: datasource=github-releases depName=M0Rf30/stremio-server-go
pkgrel=1
pkgdesc="IPv6-capable, pure-Go drop-in for Stremio's streaming server with HLS transcoding and DLNA casting"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/M0Rf30/stremio-server-go"
license=('MIT')
depends=('glibc')
optdepends=(
  'ffmpeg: HLS transcoding and hardware-accelerated streaming'
  'yt-dlp: YouTube playback support (/yt endpoint)'
)
provides=("${pkgname%%-bin}")
conflicts=("${pkgname%%-bin}" "${pkgname%%-bin}-git")
options=('!strip')
source=("stremio-server.service")
source_x86_64=("${pkgname%%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/stremio-server_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname%%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/stremio-server_Linux_arm64.tar.gz")
source_armv7h=("${pkgname%%-bin}-${pkgver}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/stremio-server_Linux_armv7.tar.gz")
sha256sums=('6e4bd9080b43aebf2d634e1dff2acd8329e572935ae4f7b4fbbc8f6a521acfb8')
sha256sums_x86_64=('5b947ce1c8320b819dea5263ee20dfa948195378407821073ceba074aec32fe7')
sha256sums_aarch64=('59ecff7ff18d75dc68f8ff5e6ecf811152d4b60bcea814d1548f70e7269e79e3')
sha256sums_armv7h=('2f1b3f2960a2a6c906281f7daff6b8dc86b01f23e0ce6dfa032d2a5e0e7cd6f3')

package() {
  # Install binary
  install -Dm755 "${srcdir}/stremio-server" "${pkgdir}/usr/bin/stremio-server"

  # Install user systemd service
  install -Dm644 "${srcdir}/stremio-server.service" \
    "${pkgdir}/usr/lib/systemd/user/stremio-server.service"

  # License and documentation
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
