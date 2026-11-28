# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=waggle-bin
pkgver=0.5.3
pkgrel=1
pkgdesc="Compact artifact references for AI agent handoffs"
arch=('x86_64' 'aarch64')
url="https://github.com/modiqo/waggle"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/waggle-cli-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/waggle-cli-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('b8e2fc50c75d2c0dd93cf67da0cddf1b2cd79135d1cfa8107baf71071c729c08')
sha256sums_aarch64=('8727fc371ec3d4f33e0c70ad6cf5f8a8ac4ecadc6d6b50edb0ff52c54ceee3f8')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="waggle-cli-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="waggle-cli-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/waggle" "${pkgdir}/usr/bin/waggle"
  install -Dm644 "${_dir}/LICENSE-APACHE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${_dir}/LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
