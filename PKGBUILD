# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kafka_exporter-bin
pkgver=1.11.0
pkgrel=1
pkgdesc="Kafka exporter for Prometheus"
arch=('x86_64' 'aarch64')
url="https://github.com/danielqsj/kafka_exporter"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/kafka_exporter-${pkgver}.linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/kafka_exporter-${pkgver}.linux-arm64.tar.gz")
sha256sums_x86_64=('6a14dd10709d627d7be29a4b98fae8bb888761c7da54410e72bef8cdaf906e86')
sha256sums_aarch64=('4f5f0341cd5345d863b3017eb9bc143f653c43a7b37cd2bc5a6a4b028ef61c45')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="kafka_exporter-${pkgver}.linux-amd64" ;;
    aarch64) _dir="kafka_exporter-${pkgver}.linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/kafka_exporter" "${pkgdir}/usr/bin/kafka_exporter"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
