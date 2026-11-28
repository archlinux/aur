# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ledgerforge-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Ledger for AI-native money movement"
arch=('x86_64' 'aarch64')
url="https://github.com/devaccuracy/ledgerforge"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/ledgerforge_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/ledgerforge_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('f5eac2fab3abe71dcc909dfdb9759cddf6dc610e5d69c55e4e00c94f3cff3cbc')
sha256sums_aarch64=('eaeac51d24b95ec9850affae50b181d5e99865fb94456d02cc14df9c8c8127cd')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="ledgerforge_v${pkgver}_linux_amd64" ;;
    aarch64) _dir="ledgerforge_v${pkgver}_linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/ledgerforge" "${pkgdir}/usr/bin/ledgerforge"
  install -Dm755 "${_dir}/ledgerforge-mcp" "${pkgdir}/usr/bin/ledgerforge-mcp"
  install -Dm644 "${_dir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
