# Maintainer: Lucas Oskorep <lucas.oskorep@gmail.com>
pkgname=insta360-link-controller-bin
_pkgname=insta360-link-controller
pkgver=0.1.3
pkgrel=1
pkgdesc="Pure-Rust cross-platform controller suite (GUI, CLI, HTTP/WS server) for Insta360 Link webcams"
arch=(x86_64 aarch64)
url="https://github.com/lucasoskorep/insta360-link-controller"
license=(MIT Apache-2.0)
depends=(
  glibc
  gcc-libs
  ffmpeg
  libxkbcommon
  hicolor-icon-theme
)
provides=(insta360-link-controller)
conflicts=(insta360-link-controller)
options=(!strip)

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/lucasoskorep/insta360-link-controller/releases/download/v${pkgver}/insta360-link-controller-v${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/lucasoskorep/insta360-link-controller/releases/download/v${pkgver}/insta360-link-controller-v${pkgver}-linux-arm64.tar.gz")

sha256sums_x86_64=('282a67a5d592c05b61389adf9b2a0ba87e1691630bbb08eb9b03f7c07661bdf5')
sha256sums_aarch64=('3a7b1974b79cfc2b714738d684057ce3cfce5d9286cdd572edde5f95168ba2a7')

package() {
  local _arch_suffix
  if [[ "${CARCH}" == "aarch64" ]]; then
    _arch_suffix="linux-arm64"
  else
    _arch_suffix="linux-x86_64"
  fi
  local extracted_dir="${srcdir}/insta360-link-controller-v${pkgver}-${_arch_suffix}"

  install -Dm755 "${extracted_dir}/insta360-link-gui" "${pkgdir}/usr/bin/insta360-link-gui"
  install -Dm755 "${extracted_dir}/insta360-link-ctl" "${pkgdir}/usr/bin/insta360-link-ctl"
  install -Dm755 "${extracted_dir}/insta360-link-server" "${pkgdir}/usr/bin/insta360-link-server"
  install -Dm644 "${extracted_dir}/assets/insta360-link-controller.desktop" "${pkgdir}/usr/share/applications/insta360-link-controller.desktop"
  install -Dm644 "${extracted_dir}/assets/insta360-link-controller.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/insta360-link-controller.svg"
  install -Dm644 "${extracted_dir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
