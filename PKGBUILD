# Maintainer: robertfoster

pkgname=aulos-bin
_pkgname=aulos
_appid=io.github.m0rf30.Aulos
pkgver=0.8.0 # renovate: datasource=github-releases depName=M0Rf30/aulos
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
sha256sums_x86_64=('fcf32461d0db71c2795ab964e2697e526ed3cc4c98c9e6af8296b67b01ee62f9')
sha256sums_aarch64=('5002b4413217385ff699623dfceb667ca921f18dbcc0805ff69019089cc12f93')

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
