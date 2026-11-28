# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ic-wasm-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Transform Wasm canisters for the Internet Computer"
arch=('x86_64' 'aarch64')
url="https://github.com/dfinity/ic-wasm"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/ic-wasm-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/ic-wasm-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('f6d40d67596fbe91a5f2c2cdbac2ace162305246dd35bcd30e34230e7f91dff8')
sha256sums_aarch64=('5a9bc9d475ab3eb8ebdac10ac2a6564e37292e0a47253646fe50bf9907dee2a8')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="ic-wasm-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="ic-wasm-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/ic-wasm" "${pkgdir}/usr/bin/ic-wasm"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
