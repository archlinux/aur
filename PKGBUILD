# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=resgate-bin
pkgver=1.8.0
pkgrel=1
pkgdesc="Realtime API gateway for NATS"
arch=('x86_64' 'aarch64')
url="https://github.com/resgateio/resgate"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/resgate-v${pkgver}-linux-amd64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/resgate-v${pkgver}-linux-arm64.zip")
sha256sums_x86_64=('3d403112ca7cd6d0fef43a8acf3e10cc4ff92e65cb2b873d313f45b5bd019bce')
sha256sums_aarch64=('d2e4c9e6bfb832957e88560202a00aded839148d838d9ad0a81feedfb6f02578')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="resgate-v${pkgver}-linux-amd64" ;;
    aarch64) _dir="resgate-v${pkgver}-linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/resgate" "${pkgdir}/usr/bin/resgate"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
