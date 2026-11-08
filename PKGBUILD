# Maintainer: Tandem maintainers <actions@github.com>
pkgname=tandem-bin
pkgver=0.17.5
pkgrel=1
pkgdesc='Local-first CLI/TUI for human and agent project coordination'
arch=('x86_64')
url='https://github.com/Algorant/tandem'
license=('MIT')
depends=('gcc-libs')
provides=('tandem')
conflicts=('tandem')
source_x86_64=("tandem-${pkgver}-x86_64-unknown-linux-gnu.tar.xz::https://github.com/Algorant/tandem/releases/download/tandem-v${pkgver}/tandem-x86_64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('556ff94beffad776a52319788ec8248c7394ab3a7fb9e8e1663a1fb186423cc6')

package() {
  local tandem_bin
  tandem_bin="$(find "${srcdir}" -type f -name tandem -perm -u+x | head -n 1)"
  if [[ -z "${tandem_bin}" ]]; then
    echo 'tandem binary not found in release archive' >&2
    return 1
  fi
  install -Dm755 "${tandem_bin}" "${pkgdir}/usr/bin/tandem"
}
