# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=ringboard
pkgname=${_pkgname}-bin
pkgver=0.17.0
pkgrel=1
pkgdesc='Fast, efficient, and composable clipboard manager for Linux'
arch=('x86_64' 'aarch64')
url='https://github.com/SUPERCILEX/clipboard-history'
license=('Apache-2.0' 'AGPL-3.0-only')
depends=('libgcc' 'libglvnd' 'libx11' 'libxcursor' 'libxi' 'libxkbcommon' 'libxkbcommon-x11' 'libxrender' 'wayland')
provides=("${_pkgname}=$pkgver")
conflicts=("${_pkgname}")
install=${_pkgname}.install
options=('!debug')
_relbase="${url}/releases/download/${pkgver}"
source=(
  "clipboard-history-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('16fcb76a4600e5d1f1b200be9d440f3614783286a6a9ef248149eeeb6b884d27')
source_x86_64=(
  "${_pkgname}-${pkgver}-x86_64::${_relbase}/x86_64-unknown-linux-gnu-${_pkgname}"
  "${_pkgname}-server-${pkgver}-x86_64::${_relbase}/x86_64-unknown-linux-gnu-${_pkgname}-server"
  "${_pkgname}-x11-${pkgver}-x86_64::${_relbase}/x86_64-unknown-linux-gnu-${_pkgname}-x11"
  "${_pkgname}-wayland-${pkgver}-x86_64::${_relbase}/x86_64-unknown-linux-gnu-${_pkgname}-wayland"
  "${_pkgname}-egui-${pkgver}-x86_64::${_relbase}/x86_64-unknown-linux-gnu-${_pkgname}-egui"
  "${_pkgname}-tui-${pkgver}-x86_64::${_relbase}/x86_64-unknown-linux-gnu-${_pkgname}-tui"
  "wayland-interface-check-${pkgver}-x86_64::${_relbase}/x86_64-unknown-linux-gnu-wayland-interface-check"
)
sha256sums_x86_64=(
  'd590520c34008fdc199d2ce6f19eae8bc4d23a4363f37b7efee491988a07e461'
  'd9eb374ff6e4fe574f55eeb01309c8e05c21ae1c2eae032163992411fdb2bc5e'
  '03591b67c0ca6220281c08d9df062096a8dd5ebf0c2c98077017a66e47f504e9'
  'd56672bcd7b1172c280556e7035218e3611e188309eff186d9c138b5cf397c84'
  '77820c8370e95be365cb9376da71c9b443eb26f1357291bc5aab7ad03c7e1b0b'
  '89fbdf07156588c8dd437db8d8c7c771d24312d1c9d7dc0ee058621c8fe396c7'
  '211f82736e55b7bcc974564fa63c999e78043bf8c09dc62396c691c2e4657d8a'
)
source_aarch64=(
  "${_pkgname}-${pkgver}-aarch64::${_relbase}/aarch64-unknown-linux-gnu-${_pkgname}"
  "${_pkgname}-server-${pkgver}-aarch64::${_relbase}/aarch64-unknown-linux-gnu-${_pkgname}-server"
  "${_pkgname}-x11-${pkgver}-aarch64::${_relbase}/aarch64-unknown-linux-gnu-${_pkgname}-x11"
  "${_pkgname}-wayland-${pkgver}-aarch64::${_relbase}/aarch64-unknown-linux-gnu-${_pkgname}-wayland"
  "${_pkgname}-egui-${pkgver}-aarch64::${_relbase}/aarch64-unknown-linux-gnu-${_pkgname}-egui"
  "${_pkgname}-tui-${pkgver}-aarch64::${_relbase}/aarch64-unknown-linux-gnu-${_pkgname}-tui"
  "wayland-interface-check-${pkgver}-aarch64::${_relbase}/aarch64-unknown-linux-gnu-wayland-interface-check"
)
sha256sums_aarch64=(
  '70266da3606728a64cc2b96da1358a6b75b81e4a43c27f978f404877503e89d1'
  '2a1819c8bef6840c55eb8f15ef0438318f1de6d0a52fec4ca8217229af6c8aad'
  'c2988956cdbadedf04f37e5429df0d5ad05e0caf2060d084f84124db155b8c59'
  '6edf22f5963577e54c7303c9e570fe5d3d6ebde15705b516111ef568ffb44eb7'
  '12d6a5bf7444a373c74b32efd675dd877fb5f84d5717f94cdd00f3e438873a07'
  '513c5ef8391d9313ef5c8dfe2875208c26e40a1434e51a71c782e1d2d5021969'
  '6dec17e3248a756c6bdf4c28aee01dff7d837fedf4b288113df0e21c9b02a3c3'
)

package() {
  cd "clipboard-history-${pkgver}"

  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm755 "${srcdir}/${_pkgname}-server-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}-server"
  install -Dm755 "${srcdir}/${_pkgname}-x11-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}-x11"
  install -Dm755 "${srcdir}/${_pkgname}-wayland-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}-wayland"
  install -Dm755 "${srcdir}/${_pkgname}-egui-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}-egui"
  install -Dm755 "${srcdir}/${_pkgname}-tui-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}-tui"
  install -Dm755 "${srcdir}/wayland-interface-check-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/wayland-interface-check"

  install -Dm644 server/ringboard-server.service "${pkgdir}/usr/lib/systemd/user/ringboard-server.service"
  install -Dm644 x11/ringboard-x11.service "${pkgdir}/usr/lib/systemd/user/ringboard-x11.service"
  install -Dm644 wayland/ringboard-wayland.service "${pkgdir}/usr/lib/systemd/user/ringboard-wayland.service"
  install -Dm644 ringboard.slice "${pkgdir}/usr/lib/systemd/user/ringboard.slice"

  install -Dm644 egui/ringboard-egui.desktop "${pkgdir}/usr/share/applications/ringboard.desktop"
  install -Dm644 logo.jpeg "${pkgdir}/usr/share/pixmaps/ringboard.jpeg"

  # Drop the xdg-open shebang to avoid a hard dependency on xdg-utils.
  sed -i '1{/^#!\/usr\/bin\/env xdg-open$/d}' "${pkgdir}/usr/share/applications/ringboard.desktop"

  # Prefer the toggle UX and a deterministic icon path.
  sed -i 's|^Exec=ringboard-egui$|Exec=ringboard-egui toggle|' "${pkgdir}/usr/share/applications/ringboard.desktop"
  sed -i 's|^Icon=ringboard$|Icon=/usr/share/pixmaps/ringboard.jpeg|' "${pkgdir}/usr/share/applications/ringboard.desktop"

  install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-APACHE"
  install -Dm644 server/LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-AGPL-3.0"
}
