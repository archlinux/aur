# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=prom-label-proxy-bin
pkgver=0.16.2
pkgrel=1
pkgdesc="Proxy that enforces a label in PromQL queries"
arch=('x86_64' 'aarch64')
url="https://github.com/prometheus-community/prom-label-proxy"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/prom-label-proxy-${pkgver}.linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/prom-label-proxy-${pkgver}.linux-arm64.tar.gz")
sha256sums_x86_64=('968c71e3035fb28b3dbc63bcd6e2213a18f2d77f8a6b90e25987a5012131b1e7')
sha256sums_aarch64=('8883c5573f8fe911594c140e497fc6dded24f35d240643a3a4bc055cd8618068')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="prom-label-proxy-${pkgver}.linux-amd64" ;;
    aarch64) _dir="prom-label-proxy-${pkgver}.linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/prom-label-proxy" "${pkgdir}/usr/bin/prom-label-proxy"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
