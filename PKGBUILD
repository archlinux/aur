# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=meow-rs-bin
pkgver=0.30.0
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
sha256sums_x86_64=('026b29702521b0c168a579de2822bb0106c726355e926612b31da5fd5759e39f')
sha256sums_aarch64=('7b6578c1e088710cdca8f29fd1dca7b41b49c37693f33440d34d493bfee4ac3b')

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
