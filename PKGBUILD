# Maintainer: robertfoster

pkgname=lactea-bin
_pkgname=lactea
pkgver=0.2.1 # renovate: datasource=github-releases depName=M0Rf30/lactea extractVersion=^v(?<version>.*)$
pkgrel=1
pkgdesc="MilkDrop 2 / 3 and projectM-compatible music visualizer on wgpu, with C library (binary release)"
arch=(x86_64)
url="https://github.com/M0Rf30/lactea"
license=('MIT OR Apache-2.0')
depends=(
  alsa-lib
  libgcc
  glibc
  hicolor-icon-theme
  libpipewire
  libxkbcommon
  vulkan-icd-loader
  wayland
)
optdepends=(
  'projectm-presets-m0rf30-git: preset collection'
  'pipewire-pulse: capture of the default sink monitor ("what you hear")'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!strip !debug)
source=("${_pkgname}-${pkgver}-LICENSE-MIT::https://raw.githubusercontent.com/M0Rf30/lactea/v${pkgver}/LICENSE-MIT"
  "${_pkgname}-${pkgver}-LICENSE-APACHE::https://raw.githubusercontent.com/M0Rf30/lactea/v${pkgver}/LICENSE-APACHE"
  "${_pkgname}-${pkgver}-THIRD_PARTY_NOTICES.md::https://raw.githubusercontent.com/M0Rf30/lactea/v${pkgver}/THIRD_PARTY_NOTICES.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-x86_64.tar.gz")
sha256sums=('c2afe6af9683ff3c73ec628191f433bf778a1b75ab9a2c7a7118d6632237f537'
            '62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a'
            'f150af83189c671c23d26eb6e00aee841e6ca04a6b4575b91072dc58cfeef214')
sha256sums_x86_64=('80ddf8e6639981d28b67e3f8bde536eea88dd037152086f545254ed8416d0fd1')

package() {
  cd "${_pkgname}-v${pkgver}-linux-x86_64"

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${_pkgname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"

  install -Dm755 "lib/lib${_pkgname}_capi.so" "${pkgdir}/usr/lib/lib${_pkgname}_capi.so"
  install -Dm644 "include/${_pkgname}.h" "${pkgdir}/usr/include/${_pkgname}.h"
  install -Dm644 examples/*.c -t "${pkgdir}/usr/share/doc/${pkgname}/examples"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}-LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}-LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}-THIRD_PARTY_NOTICES.md" \
    "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_NOTICES.md"
}
