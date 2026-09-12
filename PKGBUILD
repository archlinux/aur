# Maintainer: nugget <vincent@sshmoi.com>

pkgname=kickoutchi-bin
pkgver=1.4.4
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
sha256sums_x86_64=("8ecc71d6db576bf93d235c6a80eb5951aa3e30240a817d52123dab6f4a94f837")
sha256sums_aarch64=("22844e05bef7ea79d73d81f5ce2b8393ed8ae24e45d95d0a3176a4e9abe87895")

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
