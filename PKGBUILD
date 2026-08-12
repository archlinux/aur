# Maintainer: nugget <vincent@sshmoi.com>

pkgname=kickoutchi-bin
pkgver=1.4.0
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
sha256sums_x86_64=("4049b9de5996d5a5db5e4e6c24e80178c683e205bb91be260875e2160a81f20f")
sha256sums_aarch64=("335d4f8d7d170799b0d36337f5727d8a1a67c5326342983702c7813c292df528")

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
