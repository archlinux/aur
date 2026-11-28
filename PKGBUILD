# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=avalanche-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Prometheus and OpenMetrics series generator for load testing"
arch=('x86_64' 'aarch64')
url="https://github.com/prometheus-community/avalanche"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/avalanche-${pkgver}.linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/avalanche-${pkgver}.linux-arm64.tar.gz")
sha256sums_x86_64=('b7979c28fe07540e21403c025a242abd62993dba7a754ec7d7f4fe2360cd0aaf')
sha256sums_aarch64=('eccb429fcaf1453ae26ccf41bad371b9a293e7f91a8a40cb73e203a210f70eee')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="avalanche-${pkgver}.linux-amd64" ;;
    aarch64) _dir="avalanche-${pkgver}.linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/avalanche" "${pkgdir}/usr/bin/avalanche"
  install -Dm755 "${_dir}/mtypes" "${pkgdir}/usr/bin/mtypes"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
