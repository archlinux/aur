# Maintainer: Tandem maintainers <actions@github.com>
pkgname=tandem-bin
pkgver=0.6.0
pkgrel=1
pkgdesc='Local-first CLI/TUI for human and agent project coordination'
arch=('x86_64')
url='https://github.com/Algorant/tandem'
license=('MIT')
depends=('gcc-libs')
provides=('tandem')
conflicts=('tandem')
source_x86_64=("tandem-${pkgver}-x86_64-unknown-linux-gnu.tar.xz::https://github.com/Algorant/tandem/releases/download/tandem-v${pkgver}/tandem-x86_64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('02a517634dcde4e0ea24aaf31a2226cad8b6fa63f8c480e38a3611e497a6ecb2')

package() {
  local tandem_bin
  tandem_bin="$(find "${srcdir}" -type f -name tandem -perm -u+x | head -n 1)"
  if [[ -z "${tandem_bin}" ]]; then
    echo 'tandem binary not found in release archive' >&2
    return 1
  fi
  install -Dm755 "${tandem_bin}" "${pkgdir}/usr/bin/tandem"
}
