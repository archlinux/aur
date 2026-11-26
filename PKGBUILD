# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=aiken-bin
pkgver=1.1.24
pkgrel=1
pkgdesc="Smart contract language and toolchain for Cardano"
arch=('x86_64' 'aarch64')
url="https://github.com/aiken-lang/aiken"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/aiken-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/aiken-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('c378acccdaf9533f3375ea623c948d3dcb21f7e8c5ecbb741162c53653470b13')
sha256sums_aarch64=('faea24b60ca753c3efe65ff1bd1db62622088575e1702349c5b84a75ab26b4bc')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="aiken-x86_64-unknown-linux-musl" ;;
    aarch64) _dir="aiken-aarch64-unknown-linux-musl" ;;
  esac
  install -Dm755 "${_dir}/aiken" "${pkgdir}/usr/bin/aiken"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
