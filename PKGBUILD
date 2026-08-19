# Maintainer: amtoaer <amtoaer@gmail.com>

_pkgname=lyrune
pkgname=lyrune-bin
pkgver=1.1.0
pkgrel=1
pkgdesc='Fast native QQ Music desktop client built with Rust and GPUI (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/amtoaer/lyrune'
license=('LicenseRef-Unknown')
options=('!debug' '!strip')
depends=(
  'alsa-lib'
  'fontconfig'
  'gcc-libs'
  'glibc'
  'libxcb'
  'libxkbcommon'
  'libxkbcommon-x11'
  'vulkan-driver'
  'vulkan-icd-loader'
  'wayland'
)
optdepends=('org.freedesktop.secrets: persist QQ Music credentials')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=(
  "${_pkgname}.desktop::${url}/raw/v${pkgver}/packaging/arch/${_pkgname}.desktop"
  "${_pkgname}.svg::${url}/raw/v${pkgver}/crates/lyrune-app/assets/${_pkgname}.svg"
)
source_x86_64=(
  "${_pkgname}-v${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-amd64.tar.gz"
)
source_aarch64=(
  "${_pkgname}-v${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-arm64.tar.gz"
)
sha256sums=(
  '91ef70cfb609f0b32808f0cd40004f6800f43a176cb26a5819628d16c4af9f44'
  '68913e1ef3f2c4be855b046d7ec69d21371653cff22d40803a90c42cbf231abe'
)
sha256sums_x86_64=(
  '89d43f6e02a9ef723cf533671cc7175031289863309ebb4842d619b6baa252ce'
)
sha256sums_aarch64=(
  '1d01d7abd4418bdc70a49591edeb3d94ad5599c386071135d743d7314fabb4af'
)

package() {
  local asset_arch
  case "${CARCH}" in
    x86_64) asset_arch=amd64 ;;
    aarch64) asset_arch=arm64 ;;
  esac

  local archive_root="${srcdir}/${_pkgname}-v${pkgver}-linux-${asset_arch}"
  install -Dm755 "${archive_root}/${_pkgname}" \
    "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${srcdir}/${_pkgname}.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
  install -Dm644 "${archive_root}/README.md" \
    "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "${archive_root}/THIRD_PARTY_NOTICES.md" \
    "${pkgdir}/usr/share/doc/${_pkgname}/THIRD_PARTY_NOTICES.md"
  install -Dm644 "${archive_root}/license-unknown.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/license-unknown.txt"
}
