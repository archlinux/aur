# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=collectd_exporter-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="Prometheus exporter for collectd stats received over HTTP"
arch=('x86_64' 'aarch64')
url="https://github.com/prometheus/collectd_exporter"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/collectd_exporter-${pkgver}.linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/collectd_exporter-${pkgver}.linux-arm64.tar.gz")
sha256sums_x86_64=('734bc83d67b3a8f2eba0b6a9b089078387509f1c5e74136b6a6d2ef5567401b6')
sha256sums_aarch64=('1a96a19392bb8f4f4175563ea57a933acd51323bcd10b4a623a2584e126be65d')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="collectd_exporter-${pkgver}.linux-amd64" ;;
    aarch64) _dir="collectd_exporter-${pkgver}.linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/collectd_exporter" "${pkgdir}/usr/bin/collectd_exporter"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
