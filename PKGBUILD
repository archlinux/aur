# Maintainer: nugget <vincent@sshmoi.com>

pkgname=kickoutchi-bin
pkgver=1.6.0
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
sha256sums_x86_64=("453876200017d2eda009a83be7e91088d7770cf291c9e85f5622c0fa5bb16310")
sha256sums_aarch64=("ffe86b1eb776df63457a353069e824c383dde3349c29bd1c1fee0f565b02b7e6")

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
  # `kick` is the same program; a symlink avoids a second copy on disk.
  ln -s kickoutchi "${pkgdir}/usr/bin/kick"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
