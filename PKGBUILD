# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mongodb_exporter-bin
pkgver=0.54.0
pkgrel=1
pkgdesc="Prometheus exporter for MongoDB"
arch=('x86_64' 'aarch64')
url="https://github.com/percona/mongodb_exporter"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/mongodb_exporter-${pkgver}.linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/mongodb_exporter-${pkgver}.linux-arm64.tar.gz")
sha256sums_x86_64=('84e5c8145f4e78df2915f5aa8f3ccddbfd1b817d6a29db5a27525bb68b4095b4')
sha256sums_aarch64=('79cb0d5137cc439d9ad385fe23667273d4f9c5a960c33141ed99b85e28172552')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="mongodb_exporter-${pkgver}.linux-amd64" ;;
    aarch64) _dir="mongodb_exporter-${pkgver}.linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/mongodb_exporter" "${pkgdir}/usr/bin/mongodb_exporter"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
