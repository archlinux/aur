# Maintainer: AscendLiu <ascendliu@qq.com>

pkgname=computer-use-linux-bin
_pkgname=computer-use-linux
pkgver=0.2.9
pkgrel=1
pkgdesc='Linux desktop control over MCP — AT-SPI accessibility tree, multi-compositor window targeting (GNOME, KWin, Hyprland, i3, COSMIC), screencast portal screenshots, and ydotool input synthesis. Wayland-first, X11 best-effort.'
arch=('x86_64')
url='https://github.com/agent-sh/computer-use-linux'
license=('MIT')
options=('!debug')
depends=(
  'dbus'
  'openssl'
  'curl'
  'ydotool'
  'at-spi2-core'
)
optdepends=(
  'gnome-shell: GNOME Shell extension for window listing/focus'
)
install="${_pkgname}.install"
source=(
  "${_pkgname}::https://github.com/agent-sh/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu"
  "${_pkgname}-cosmic::https://github.com/agent-sh/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-cosmic-x86_64-unknown-linux-gnu"
  "${_pkgname}-${pkgver}.tar.gz::https://github.com/agent-sh/${_pkgname}/archive/v${pkgver}.tar.gz"
  "ydotoold.service"
)
sha256sums=(
  '73e0329ce2f45571d330ee16f4ea73d1acdd0391aba3b7867654eea7fec91c7f'
  'ef3d30f68fbcc4eed6f90eb5ed03b7a818a9ed468006726b8ebb8b22973e005a'
  'SKIP'
  '4cdc91505f77b2d8897015b8dbbdb3d5704ae4b9727e891d2a2c3fac180bc51b'
)

package() {
  cd "${srcdir}"

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm755 "${_pkgname}-cosmic" "${pkgdir}/usr/bin/${_pkgname}-cosmic"

  install -Dm644 "ydotoold.service" "${pkgdir}/usr/lib/systemd/user/ydotoold.service"

  local ext_uuid="${_pkgname}@avifenesh.dev"
  local ext_dir="${pkgdir}/usr/share/gnome-shell/extensions/${ext_uuid}"
  install -Dm644 "${_pkgname}-${pkgver}/gnome-shell-extension/${ext_uuid}/metadata.json" "${ext_dir}/metadata.json"
  install -Dm644 "${_pkgname}-${pkgver}/gnome-shell-extension/${ext_uuid}/extension.js" "${ext_dir}/extension.js"

  install -Dm644 "${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
