# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gasper-bin
pkgver=1.0
pkgrel=1
pkgdesc="Self-hosted cloud platform in a single binary"
arch=('x86_64' 'aarch64')
url="https://github.com/sdslabs/gasper"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/sdslabs/gasper/v${pkgver}/LICENSE.md")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/gasper_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/gasper_v${pkgver}_linux_arm64.tar.gz")
sha256sums=('8d5420c73c9b6a348e0a6335f4bfcb048767365226d155752766f2f02c71f014')
sha256sums_x86_64=('254c6566ed5917b34ff439df746c81d6a48a6d95729c2c34ca423b008d767160')
sha256sums_aarch64=('b0673d9ae06e9bf707c0ea004575fec7aadc1960814ca19d4b2eeee1d73e8d39')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="gasper_v${pkgver}_linux_amd64" ;;
    aarch64) _dir="gasper_v${pkgver}_linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/gasper" "${pkgdir}/usr/bin/gasper"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
