# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=modbus_exporter-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Prometheus exporter for Modbus devices"
arch=('x86_64' 'aarch64')
url="https://github.com/RichiH/modbus_exporter"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/modbus_exporter-${pkgver}.linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/modbus_exporter-${pkgver}.linux-arm64.tar.gz")
sha256sums_x86_64=('82e51b025a1d0ba5ad0017a4b2682d3b088c92033c5929acee42900e3361d270')
sha256sums_aarch64=('ed1a70a1353288712315bfeb7a0726d71cc71dab7963b96d2dda167b4830824f')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="modbus_exporter-${pkgver}.linux-amd64" ;;
    aarch64) _dir="modbus_exporter-${pkgver}.linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/modbus_exporter" "${pkgdir}/usr/bin/modbus_exporter"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
