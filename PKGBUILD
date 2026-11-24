# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=svm-rs-bin
pkgver=0.5.32
pkgrel=1
pkgdesc="Solidity compiler version manager"
arch=('x86_64' 'aarch64')
url="https://github.com/alloy-rs/svm-rs"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" 'solidity' 'solidity-bin')
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/alloy-rs/svm-rs/v${pkgver}/LICENSE-APACHE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/svm-rs-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/svm-rs-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('29778a89fc6158b403ccc911f18b5bfc2a90b76cf01d9d0646045a4536fff9d5')
sha256sums_aarch64=('935d34adb4b348bf79902fd85df6242ff66c645194d93e2c9033d9494bc992c5')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="svm-rs-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="svm-rs-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/solc" "${pkgdir}/usr/bin/solc"
  install -Dm755 "${_dir}/svm" "${pkgdir}/usr/bin/svm"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
