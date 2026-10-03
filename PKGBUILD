# Maintainer: nugget <vincent@sshmoi.com>

pkgname=kickoutchi-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="TUI and CLI to see which process owns a local port and kill it safely (prebuilt)"
arch=("x86_64" "aarch64")
url="https://github.com/nuggocto/kickoutchi"
license=("MIT")
depends=("gcc-libs")
provides=("kickoutchi=${pkgver}")
conflicts=("kickoutchi")
options=("!debug")

_archive_x86_64="kickoutchi-x86_64-unknown-linux-gnu.tar.xz"
_archive_aarch64="kickoutchi-aarch64-unknown-linux-gnu.tar.xz"
source_x86_64=("${pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.xz::${url}/releases/download/v${pkgver}/${_archive_x86_64}")
source_aarch64=("${pkgname}-${pkgver}-aarch64-unknown-linux-gnu.tar.xz::${url}/releases/download/v${pkgver}/${_archive_aarch64}")
sha256sums_x86_64=("a6fa5b9439cab035fbe9c686583abe16497e5ec00c24b66ca1690f7168961c23")
sha256sums_aarch64=("e7fdc75565402684f3d239ceda5e30e19f824ac609733eb834041837a08240b4")

_dist_target() {
  case "${CARCH}" in
    x86_64) printf "%s" "x86_64-unknown-linux-gnu" ;;
    aarch64) printf "%s" "aarch64-unknown-linux-gnu" ;;
    *) return 1 ;;
  esac
}

package() {
  local dist_target
  dist_target="$(_dist_target)"
  cd "kickoutchi-${dist_target}"
  install -Dm755 "kickoutchi" "${pkgdir}/usr/bin/kickoutchi"
  install -Dm755 "kick" "${pkgdir}/usr/bin/kick"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
