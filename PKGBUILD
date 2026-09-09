# Maintainer: Tandem maintainers <actions@github.com>
pkgname=tandem-bin
pkgver=0.13.0
pkgrel=1
pkgdesc='Local-first CLI/TUI for human and agent project coordination'
arch=('x86_64')
url='https://github.com/Algorant/tandem'
license=('MIT')
depends=('gcc-libs')
provides=('tandem')
conflicts=('tandem')
source_x86_64=("tandem-${pkgver}-x86_64-unknown-linux-gnu.tar.xz::https://github.com/Algorant/tandem/releases/download/tandem-v${pkgver}/tandem-x86_64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('ac0f13954ad64e57d4abade4496b274a7a8f76cf80c7caf65e1c60b0329206a5')

package() {
  local tandem_bin
  tandem_bin="$(find "${srcdir}" -type f -name tandem -perm -u+x | head -n 1)"
  if [[ -z "${tandem_bin}" ]]; then
    echo 'tandem binary not found in release archive' >&2
    return 1
  fi
  install -Dm755 "${tandem_bin}" "${pkgdir}/usr/bin/tandem"
}
