# Maintainer: robertfoster

pkgname=aulos-bin
_pkgname=aulos
_appid=io.github.m0rf30.Aulos
pkgver=0.1.3 # renovate: datasource=github-releases depName=M0Rf30/aulos
pkgrel=1
pkgdesc="A modern music player for the COSMIC desktop (binary release)"
arch=(x86_64 aarch64)
url="https://github.com/M0Rf30/aulos"
license=(GPL-3.0-only)
depends=(
  alsa-lib
  glibc
  hicolor-icon-theme
  libgcc
  libgl
  libpipewire
  libstdc++
  libxkbcommon
  wayland
)
optdepends=(
  'vulkan-icd-loader: GPU accelerated rendering'
  'projectm: visualizer presets'
  'ffmpeg: lossy audio conversion'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!strip !debug)
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('9d607f4f894c3104bcb368dcad33e48a86176f2b8384b811e8e5c957e05a9b51')
sha256sums_aarch64=('f9eab6c34a2a08a8f2eccb772643e1afb11b08ea586247b7f7a601b171c911aa')

package() {
  cd "${_pkgname}-${pkgver}-${CARCH}-unknown-linux-gnu"

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "resources/${_appid}.desktop" \
    "${pkgdir}/usr/share/applications/${_appid}.desktop"
  install -Dm644 "resources/${_appid}.metainfo.xml" \
    "${pkgdir}/usr/share/metainfo/${_appid}.metainfo.xml"
  install -Dm644 "resources/icons/hicolor/scalable/apps/${_appid}.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_appid}.svg"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
