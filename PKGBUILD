# Maintainer: Lucas Oskorep <lucas.oskorep@gmail.com>
pkgname=open-360-link-bin
_pkgname=open-360-link
pkgver=0.1.5
pkgrel=1
pkgdesc="Open 360 Link: Pure-Rust cross-platform controller suite (GUI, CLI, HTTP/WS server) for Insta360 Link webcams"
arch=(x86_64 aarch64)
url="https://github.com/lucasoskorep/open-360-link"
license=(MIT Apache-2.0)
depends=(
  glibc
  gcc-libs
  ffmpeg
  libxkbcommon
  hicolor-icon-theme
)
provides=(open-360-link insta360-link-controller)
conflicts=(open-360-link insta360-link-controller insta360-link-controller-bin)
replaces=(insta360-link-controller-bin)
options=(!strip)

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/lucasoskorep/open-360-link/releases/download/v${pkgver}/open-360-link-v${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/lucasoskorep/open-360-link/releases/download/v${pkgver}/open-360-link-v${pkgver}-linux-arm64.tar.gz")

sha256sums_x86_64=('e556a5f5453ed9320c4a41574bfa75fa359458ebb2c5749bdc763db8153be91e')
sha256sums_aarch64=('8efb105532d353bcb7fcf3f3b181b48b668619497aede2981ea281c155ee786c')

package() {
  local _arch_suffix
  if [[ "${CARCH}" == "aarch64" ]]; then
    _arch_suffix="linux-arm64"
  else
    _arch_suffix="linux-x86_64"
  fi
  local extracted_dir="${srcdir}/open-360-link-v${pkgver}-${_arch_suffix}"

  install -Dm755 "${extracted_dir}/open-360-link-gui" "${pkgdir}/usr/bin/open-360-link-gui"
  install -Dm755 "${extracted_dir}/open-360-link-ctl" "${pkgdir}/usr/bin/open-360-link-ctl"
  install -Dm755 "${extracted_dir}/open-360-link-server" "${pkgdir}/usr/bin/open-360-link-server"
  install -Dm644 "${extracted_dir}/assets/open-360-link.desktop" "${pkgdir}/usr/share/applications/open-360-link.desktop"
  install -Dm644 "${extracted_dir}/assets/open-360-link.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/open-360-link.svg"
  install -Dm644 "${extracted_dir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
