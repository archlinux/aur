# Maintainer: robertfoster
pkgname=stremio-server-go-bin
pkgver=0.12.0 # renovate: datasource=github-releases depName=M0Rf30/stremio-server-go
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
backup=("etc/stremio-server/stremio-server.env")
source=("stremio-server.service"
  "stremio-server.env")
source_x86_64=("${pkgname%%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/stremio-server_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname%%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/stremio-server_Linux_arm64.tar.gz")
source_armv7h=("${pkgname%%-bin}-${pkgver}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/stremio-server_Linux_armv7.tar.gz")
sha256sums=('db36d59eae51f133ef0eaf3100667172564ae69e377aeab897e625830be3bc84'
            '64e0d5fe57f94c7a80233c78b4c887fa429b5aa18cd91c2f5f51d91723120e55')
sha256sums_x86_64=('12ba364e1ee5ff53709a6c9ea324c94f339cf88eef50a47d08658572c84030c2')
sha256sums_aarch64=('deb245a9ce1dd3e1090738dc86ae3bbded72acd86170ccaa76dc62d0b623a7d5')
sha256sums_armv7h=('20bf3f9e7f33885312629eb4436ad3e4e935c4b5393bf36fb73c3731d9437676')

package() {
  # Install binary
  install -Dm755 "${srcdir}/stremio-server" "${pkgdir}/usr/bin/stremio-server"

  # Install user systemd service
  install -Dm644 "${srcdir}/stremio-server.service" \
    "${pkgdir}/usr/lib/systemd/user/stremio-server.service"

  # Install default environment file
  install -Dm644 "${srcdir}/stremio-server.env" \
    "${pkgdir}/etc/stremio-server/stremio-server.env"

  # License and documentation
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
