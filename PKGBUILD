# Maintainer: robertfoster

pkgname=aulos-bin
_pkgname=aulos
_appid=io.github.m0rf30.Aulos
pkgver=0.7.1 # renovate: datasource=github-releases depName=M0Rf30/aulos
pkgrel=1
pkgdesc="A modern music player: local library, Subsonic, MPD, podcasts, radio and a MilkDrop visualizer (binary release)"
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
  'ffmpeg: lossy audio conversion'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!strip !debug)
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('cf9b8c1286cb07e6c7caae9c709ba50db11daf8f79b52ce047ce954307d9e6d4')
sha256sums_aarch64=('b6cee7843daac7748372cbe0feea82d94edd080dc15611b2c9b6478970dfc737')

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
