# Maintainer: robertfoster
pkgname=stream-server-bin
pkgver=0.1.8 # renovate: datasource=github-releases depName=perpetus/stream-server
pkgrel=1
pkgdesc="High-performance, open-source torrent streaming engine - a drop-in alternative to Stremio's server.js"
arch=('x86_64')
url="https://github.com/perpetus/stream-server"
license=('MIT')
depends=('glibc' 'gcc-libs' 'openssl' 'libtorrent-rasterbar' 'gtk3')
optdepends=('ffmpeg: HLS transcoding, video probing and subtitle extraction')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!strip')
source=("stream-server.service"
        "LICENSE::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${pkgname%-bin}-${pkgver}::${url}/releases/download/v${pkgver}/stream-server-linux-amd64")
sha256sums=('267db8e2fa630b33b249263fb94e16fe9d8474e1d6655d3151e61d8fb9e4e60c'
            '3f00e0ea84e0ae94f176beb5bd2d3d5e6ab2240000075bdf497ab4eb8d74d7a9')
sha256sums_x86_64=('ae3c767ca0d2e9cdf3815df6ac2d714639df99090faba706376f80813490c5a6')

package() {
  # Streaming server binary
  install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"

  # User systemd service (listens on http://127.0.0.1:11470)
  install -Dm644 "${srcdir}/stream-server.service" \
    "${pkgdir}/usr/lib/systemd/user/stream-server.service"

  # License
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
