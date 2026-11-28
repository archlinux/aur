# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=utreexod-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Fully validating Bitcoin node with Utreexo support"
arch=('x86_64' 'aarch64')
url="https://github.com/utreexo/utreexod"
license=('ISC')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/utreexo/utreexod/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/utreexod-linux-amd64-20260623-01.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/utreexod-linux-arm64-20260623-01.tar.gz")
sha256sums=('46021938caf87eeb92c841fd48777a3a7bf218341386611c4d080aa45812d1d2')
sha256sums_x86_64=('815a66bf8ff53aaa9cdd1d6ed39bf6a305ff644a784f56fe88dc3d599e292383')
sha256sums_aarch64=('193861b6ed55e91dd51745ad72f041a804b00d74b35d499004f16fd7c7980fe7')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="utreexod-linux-amd64-20260623-01" ;;
    aarch64) _dir="utreexod-linux-arm64-20260623-01" ;;
  esac
  install -Dm755 "${_dir}/utreexod" "${pkgdir}/usr/bin/utreexod"
  install -Dm755 "${_dir}/utreexoctl" "${pkgdir}/usr/bin/utreexoctl"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
