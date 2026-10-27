# Maintainer: Pol Rivero <aur at polrivero dot com>
pkgname=omasnap-bin
_pkgname=omasnap
pkgver=1.24.0
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

sha256sums=('3599747e99e56d0fdf121cdbd0f875432b20349db304ddc5f2c7f4bd2bc8fb9a'
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
