# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=meow-rs-bin
pkgver=0.29.0
pkgrel=1
pkgdesc="Rust implementation of the mihomo (Clash Meta) proxy kernel"
arch=('x86_64' 'aarch64')
url="https://github.com/meow-rs/meow-rs"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/meow-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/meow-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('688778d86557b71e952812644e092c91b8e5f3ed1ac98a0dbb097bfb6023f328')
sha256sums_aarch64=('7e0080f3a15d7b26f64297a926c960aab9a3c6428e0bd6883d6efa4b17aee62f')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="meow-v${pkgver}-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="meow-v${pkgver}-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/meow-cli" "${pkgdir}/usr/bin/meow-cli"
  install -Dm755 "${_dir}/meow" "${pkgdir}/usr/bin/meow"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
