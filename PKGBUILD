# Maintainer: robertfoster

pkgname=kodi-addon-visualization-lactea
_addonid=visualization.lactea
pkgver=21.0.0 # renovate: datasource=github-releases depName=M0Rf30/visualization.lactea extractVersion=^v(?<version>.*)$
pkgrel=1
pkgdesc='Lactea visualizer for Kodi: MilkDrop 2/3 and projectM-compatible presets rendered by a pure-Rust engine on wgpu'
arch=(x86_64)
url='https://github.com/M0Rf30/visualization.lactea'
license=('GPL-2.0-or-later')
depends=(
  gcc-libs
  glibc
  lactea
  libgl
)
makedepends=(
  cmake
  kodi-dev
)
optdepends=(
  'projectm-presets-m0rf30-git: preset collection'
  'projectm-presets: preset collection'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ae6d8e1546d510db7531b27d5c3cd0eb6829fe8409aa6f59fa8b44b34624f667')

build() {
  cmake -S "${_addonid}-${pkgver}" -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DKodi_DIR=/usr/lib/kodi/cmake \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 "${_addonid}-${pkgver}/LICENSE.md" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
