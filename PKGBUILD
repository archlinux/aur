# Maintainer: Lucas Oskorep <lucas.oskorep@gmail.com>
pkgname=insta360-link-controller-bin
_pkgname=insta360-link-controller
pkgver=0.1.2
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

sha256sums_x86_64=('e46c0f536e98ba54d04b8a8b23d36fe6e14f2d0002bd9d15af283530bfdd73fe')
sha256sums_aarch64=('48b2234d69cad389d698315774bc0dbb2235d6e6ee51807ceb8f5be8fed6d075')

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
