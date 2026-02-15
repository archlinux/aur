# Maintainer: Pysio <qq593277393@outlook.com>
pkgname=loliashizuku-bin
pkgver=0.0.2
pkgrel=1
pkgdesc="Wails-powered third-party desktop client for Lolia FRP (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/Mxmilu666/LoliaShizuku"
license=('MIT')
depends=(
  'gtk3'
  'webkit2gtk'
  'ca-certificates'
  'tzdata'
)
provides=('loliashizuku')
conflicts=('loliashizuku' 'loliashizuku-git')
_url_base="https://github.com/Mxmilu666/LoliaShizuku/releases/download/v${pkgver}"
source_x86_64=("${_url_base}/LoliaShizuku-v${pkgver}-linux-amd64.pkg.tar.zst")
source_aarch64=("${_url_base}/LoliaShizuku-v${pkgver}-linux-arm64.pkg.tar.zst")
sha256sums_x86_64=('e94f857c2f52a1abb7b6ea81913360fedfe3e0957a8a9582f7ebaf24db7aac1b')
sha256sums_aarch64=('c3a94d8404490dbe12f254b91fc4e04ef1b45fc10f139f86933ac6a841f1334a')

package() {
  # Binary: nfpm installs to /usr/local/bin, move to /usr/bin
  install -Dm755 "${srcdir}/usr/local/bin/LoliaShizuku" "${pkgdir}/usr/bin/LoliaShizuku"

  # Desktop file
  install -Dm644 "${srcdir}/usr/share/applications/loliashizuku.desktop" \
    "${pkgdir}/usr/share/applications/loliashizuku.desktop"
  sed -i 's|Exec=/usr/local/bin/LoliaShizuku|Exec=/usr/bin/LoliaShizuku|' \
    "${pkgdir}/usr/share/applications/loliashizuku.desktop"

  # Icon
  install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/loliashizuku.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/loliashizuku.png"
}
