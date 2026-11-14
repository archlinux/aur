# Maintainer: MiguelRegueiro

pkgname=elio-bin
_pkgname=elio
pkgver=1.15.0
pkgrel=2
pkgdesc='Snappy, batteries-included terminal file manager with rich previews, inline images, bulk actions, and trash support (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/elio-fm/elio'
license=('MIT')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme')
provides=("${_pkgname}=${pkgver}")
conflicts=('elio')
optdepends=(
  'poppler: PDF metadata and rendered page previews'
  'ffmpeg: audio/video metadata, artwork, thumbnails, and ffprobe support'
  'resvg: SVG rasterization'
  '7zip: archive and comic archive preview fallback'
  'libarchive: archive and ISO listing fallback through bsdtar'
)
source_x86_64=("${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('068f486964901b7dc159f0d7e46783f7053732d1ed6322edb2ff8cf1eb0dfe72')
sha256sums_aarch64=('d52749ee550cd1ada17ef167f43976d82a10fd484cbc5cb4a037579558f0531c')
source_aarch64=("${_pkgname}-${pkgver}-aarch64-unknown-linux-gnu.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")

package() {
  cd "${_pkgname}-${pkgver}-${CARCH}-unknown-linux-gnu"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  if [[ -f "packaging/linux/${_pkgname}.desktop" ]]; then
    install -Dm644 "packaging/linux/${_pkgname}.desktop" \
      "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    for size in 48 128 256 512; do
      install -Dm644 "packaging/linux/icons/hicolor/${size}x${size}/apps/${_pkgname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${_pkgname}.png"
    done
  fi
}
