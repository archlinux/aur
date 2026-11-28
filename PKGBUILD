# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ecs_exporter-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Prometheus exporter for Amazon ECS"
arch=('x86_64' 'aarch64')
url="https://github.com/prometheus-community/ecs_exporter"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/ecs_exporter-${pkgver}.linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/ecs_exporter-${pkgver}.linux-arm64.tar.gz")
sha256sums_x86_64=('b2c8bfa1e709554877c7087f2da3591320042632a1bd42adea2f2fdb8b5a9525')
sha256sums_aarch64=('bbe4cb6f35611156da14e495306750e9fb58d1d6837323e4ee4f34de838570eb')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="ecs_exporter-${pkgver}.linux-amd64" ;;
    aarch64) _dir="ecs_exporter-${pkgver}.linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/ecs_exporter" "${pkgdir}/usr/bin/ecs_exporter"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
