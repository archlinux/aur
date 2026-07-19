# Maintainer: MiguelRegueiro

pkgname=elio-bin
_pkgname=elio
pkgver=1.11.1
pkgrel=1
pkgdesc='Snappy, batteries-included terminal file manager with rich previews, inline images, bulk actions, and trash support (prebuilt binary)'
arch=('x86_64')
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
source=("${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('df048c3fca137dcddad72418d1da32c2c59b05359bef81bd6e868a609940967e')

package() {
  cd "${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu"
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
