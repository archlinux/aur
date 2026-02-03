# Maintainer: Francesc d'Assís Requesens i Roca <francescrequesens.com>

pkgname=api-calls-bin
pkgver=0.18.0
pkgrel=1
pkgdesc="A lightweight Electron-based desktop tool for sending and inspecting REST API requests."
arch=('x86_64')
url="https://github.com/elpeix/apicalls"
license=('GPL-3.0-only')
makedepends=('libarchive')
depends=(
  'gtk3'
  'nss'
  'nspr'
  'alsa-lib'
  'at-spi2-core'
  'libxcomposite'
  'libxdamage'
  'libxrandr'
  'libxkbcommon'
  'libxss'
  'libxtst'
  'mesa'
  'libdrm'
  'xdg-utils'
  'hicolor-icon-theme'
  'libnotify'
)
provides=('api-calls')
conflicts=('api-calls')
source=("${pkgname}-${pkgver}.deb::https://github.com/elpeix/apicalls/releases/download/v0.18.0/api-calls_0.18.0_amd64.deb")
sha256sums=('2c18cbf62164a042d2b0cf0fd31a083cfdb8f637edf32192f43359171624a56b')

package() {
  cd "${srcdir}"

  # Extract the .deb to a temporary directory
  rm -rf debpkg
  mkdir -p debpkg
  bsdtar -xf "${pkgname}-${pkgver}.deb" -C debpkg

  # Extract the payload to pkgdir
  bsdtar -xf debpkg/data.tar.* -C "${pkgdir}"

  # Install license
  _license_path="$(find "${pkgdir}" -maxdepth 4 -type f -iname 'LICENSE' | head -n1)"

  if [[ -n "${_license_path}" ]]; then
    install -Dm644 "${_license_path}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}
