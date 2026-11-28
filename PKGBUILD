# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ghch-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="Generate a changelog from git history, tags and merged pull requests"
arch=('x86_64' 'aarch64')
url="https://github.com/Songmu/ghch"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/ghch_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/ghch_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('61044e9e56ccf4fa5bf1064aeab0a4173df5efc7403dcf397336d593e5363a74')
sha256sums_aarch64=('9431632b5807900c54f01bc77bd4c19c094518d50d2bb57813ee5d613afbf44b')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="ghch_v${pkgver}_linux_amd64" ;;
    aarch64) _dir="ghch_v${pkgver}_linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/ghch" "${pkgdir}/usr/bin/ghch"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
