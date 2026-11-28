# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=stylance-rs-bin
pkgver=0.8.4
pkgrel=1
pkgdesc="Scoped CSS style imports for Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/basro/stylance-rs"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/stylance-cli-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/stylance-cli-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('0db85d4109c6a67277ea560720efa00cb99c3ffc9ddadb9e3581d8be1c1e4cc6')
sha256sums_aarch64=('72d8701ba581115b0f5140ac4d6b01a1f86df1020ef70d527344eab7b0771da5')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="stylance-cli-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="stylance-cli-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/stylance" "${pkgdir}/usr/bin/stylance"
  install -Dm644 "${_dir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
