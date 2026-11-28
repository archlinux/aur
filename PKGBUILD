# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=fortigate_exporter-bin
pkgver=1.25.0
pkgrel=1
pkgdesc="Prometheus exporter for FortiGate firewalls"
arch=('x86_64' 'aarch64')
url="https://github.com/prometheus-community/fortigate_exporter"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/fortigate_exporter-${pkgver}.linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/fortigate_exporter-${pkgver}.linux-arm64.tar.gz")
sha256sums_x86_64=('db0c160425e022622c5828391d7df68f3876785b3003d748f382960ba1cbb1e5')
sha256sums_aarch64=('cd80e77ad499818913b1180115c62d688b8f6269e4f6de7a660895c9fe929054')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="fortigate_exporter-${pkgver}.linux-amd64" ;;
    aarch64) _dir="fortigate_exporter-${pkgver}.linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/fortigate_exporter" "${pkgdir}/usr/bin/fortigate_exporter"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
