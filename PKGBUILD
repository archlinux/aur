# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=adrs-bin
pkgver=0.13.0
pkgrel=1
pkgdesc="Architectural Decision Record tool"
arch=('x86_64' 'aarch64')
url="https://github.com/joshrotenberg/adrs"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/adrs-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/adrs-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('15dee3fb41f22d1e511ad3bfe3ca03969bb8259ba7ce6f1b8040cba7c0ec8b04')
sha256sums_aarch64=('d006a2d78e0de24750e4b0a03ad973e6eab61120af684222dcc4acb0089b44ac')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="adrs-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="adrs-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/adrs" "${pkgdir}/usr/bin/adrs"
  install -Dm644 "${_dir}/LICENSE-APACHE-2.0" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${_dir}/LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
