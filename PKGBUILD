# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=coop-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="Isolated VM environment for running Claude Code and Codex"
arch=('x86_64' 'aarch64')
url="https://github.com/trailofbits/coop"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/coop-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/coop-v${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('e5f8c6a254789eb89e46edf816a018e3ed3a1b3c55a47be72b4f8fa8c5f01568')
sha256sums_aarch64=('fac703208a931f3b26f23de8f8d2c415d557ec0109e30392ab403fd716793405')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="coop-v${pkgver}-x86_64-unknown-linux-musl" ;;
    aarch64) _dir="coop-v${pkgver}-aarch64-unknown-linux-musl" ;;
  esac
  install -Dm755 "${_dir}/coop-proxy" "${pkgdir}/usr/bin/coop-proxy"
  install -Dm755 "${_dir}/coop" "${pkgdir}/usr/bin/coop"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
