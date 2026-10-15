# Maintainer: amtoaer <amtoaer@gmail.com>

_pkgname=lyrune
pkgname=lyrune-bin
pkgver=1.6.0
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
  'glib2'
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
  "${_pkgname}.desktop::https://raw.githubusercontent.com/amtoaer/lyrune/v${pkgver}/packaging/linux/${_pkgname}.desktop"
  "${_pkgname}.svg::https://raw.githubusercontent.com/amtoaer/lyrune/v${pkgver}/packaging/linux/${_pkgname}.svg"
)
source_x86_64=(
  "${_pkgname}-v${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-amd64.tar.gz"
)
source_aarch64=(
  "${_pkgname}-v${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-arm64.tar.gz"
)
sha256sums=('91ef70cfb609f0b32808f0cd40004f6800f43a176cb26a5819628d16c4af9f44'
            '68913e1ef3f2c4be855b046d7ec69d21371653cff22d40803a90c42cbf231abe')
sha256sums_x86_64=('76f6fed6bcb714be87eaf567b996d279fa9f8786d46e73adc4b456bedf64597a')
sha256sums_aarch64=('ca3f7bd98804b5d84e7928f06702be399c97db38c8ff6cdd6bb68227b0f7260e')

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
