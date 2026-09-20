# Maintainer: Pol Rivero <aur at polrivero dot com>
pkgname=omasnap-bin
_pkgname=omasnap
pkgver=1.21.0
pkgrel=1
pkgdesc="Native Wayland screenshot and annotation editor for Omarchy and Hyprland (prebuilt binary)"
arch=('x86_64')
url="https://github.com/tobi/omasnap"
license=('MIT')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
depends=(
  'glibc'
  'hyprland'
  'layer-shell-qt'
  'libgcc'
  'libglvnd'
  'libstdc++'
  'qt6-base'
  'wayland'
  'wl-clipboard'
)
optdepends=(
  'tesseract: extract text from screenshots (OCR)'
  'tesseract-data-eng: English training data for OCR'
)
# Upstream ships a prebuilt, unstripped binary; leave it exactly as released.
options=('!strip' '!debug')
source=(
  "${_pkgname}-${pkgver}-archlinux-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-archlinux-x86_64.tar.gz"
  "LICENSE-${pkgver}::https://raw.githubusercontent.com/tobi/omasnap/v${pkgver}/LICENSE"
)

sha256sums=('55a0dbf6c1f3c86438389ffaa471448a772466316e09041b38bc5a662f34cba5'
            'SKIP')

package() {
  # The release tarball is already a /usr filesystem tree.
  install -Dm755 "${srcdir}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" \
    -t "${pkgdir}/usr/share/applications"

  install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "${srcdir}/usr/share/licenses/${_pkgname}/"*.txt \
    -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
