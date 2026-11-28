# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=influxdb_exporter-bin
pkgver=0.12.1
pkgrel=1
pkgdesc="Prometheus exporter for InfluxDB metrics received over HTTP"
arch=('x86_64' 'aarch64')
url="https://github.com/prometheus/influxdb_exporter"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/influxdb_exporter-${pkgver}.linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/influxdb_exporter-${pkgver}.linux-arm64.tar.gz")
sha256sums_x86_64=('e460d0159e43180dfcf6e6ca6b8857d9fb763e158b84226aa4cd3ae9c2db8fe7')
sha256sums_aarch64=('f8c7ffe9d6cf9f949439900f32932957ea395e9e79561598b9b93baace69371d')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="influxdb_exporter-${pkgver}.linux-amd64" ;;
    aarch64) _dir="influxdb_exporter-${pkgver}.linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/influxdb_exporter" "${pkgdir}/usr/bin/influxdb_exporter"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
