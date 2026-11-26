# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=coverm-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Read alignment statistics for metagenomics"
arch=('x86_64' 'aarch64')
url="https://github.com/wwood/CoverM"
license=('GPL-3.0-only')
depends=('glibc' 'libgcc' 'xz')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/wwood/CoverM/v${pkgver}/LICENCE.txt")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/coverm-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/coverm-aarch64-unknown-linux-gnu.tar.xz")
sha256sums=('0ae0485a5bd37a63e63603596417e4eb0e653334fa6c7f932ca3a0e85d4af227')
sha256sums_x86_64=('1fc66a299c1cd8afaf4cd7e2f9787dfa73ab106fcc10684a42ebc194c31946e8')
sha256sums_aarch64=('95eece8ffd999694df0624a8704a1d9655a904341aa7f609db209fff1382219d')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="coverm-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="coverm-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/coverm" "${pkgdir}/usr/bin/coverm"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
