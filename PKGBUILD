# Maintainer: hup2c <huping@cmict.chinamobile.com>

pkgname=motty-bin
pkgver=0.4.7
pkgrel=1
pkgdesc='SSH, SFTP, port forwarding, VNC/RDP and AI assistant in one native window'
arch=('x86_64' 'aarch64')
url='https://motty.page'
license=('Apache-2.0')
depends=(
  'cairo'
  'fontconfig'
  'glib2'
  'glibc'
  'hicolor-icon-theme'
  'libxcb'
  'pango'
  'vulkan-icd-loader'
  'xcb-util-cursor'
)
optdepends=(
  'mesa: software Vulkan driver (lavapipe)'
  'vulkan-intel: Vulkan driver for Intel GPUs'
  'vulkan-nouveau: Vulkan driver for NVIDIA GPUs (open source)'
  'vulkan-radeon: Vulkan driver for AMD GPUs'
)
provides=('motty')
conflicts=('motty')
options=('!strip' '!debug')

_upstream=motty
_release="https://github.com/t8y2/${_upstream}/releases/download/v${pkgver}"

source=('LICENSE')
source_x86_64=("${_upstream}-${pkgver}-linux-amd64.tar.gz::${_release}/${_upstream}-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${_upstream}-${pkgver}-linux-arm64.tar.gz::${_release}/${_upstream}-${pkgver}-linux-arm64.tar.gz")
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('05f90cde18dd1afe5c4f7ce10a1fc58a384001f2433a51a168b88aafd8813539')
sha256sums_aarch64=('81ab02021b30a64bad52863f8d968229f9ab2e465b77f44f1f24edfdf36e1834')

package() {
  if [[ $CARCH == 'x86_64' ]]; then
    local _asset="linux-amd64"
  else
    local _asset="linux-arm64"
  fi

  local _dir="${_upstream}-${pkgver}-${_asset}"

  install -Dm755 "${_dir}/${_upstream}" "${pkgdir}/usr/bin/${_upstream}"
  install -Dm644 "${_dir}/${_upstream}.desktop" \
    "${pkgdir}/usr/share/applications/${_upstream}.desktop"
  install -Dm644 "${_dir}/${_upstream}.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_upstream}.png"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
