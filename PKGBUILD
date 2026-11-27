# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mongodb_exporter-bin
pkgver=0.55.0
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
sha256sums_x86_64=('82c6b65725495c28893f2df32e85ad99e9060b4abad283f35c16fa2f31a9dcd8')
sha256sums_aarch64=('1dcdb21af6c964253ad08f01a686fa93ac9417f59d2fa0de75b8117c979b93f3')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="mongodb_exporter-${pkgver}.linux-amd64" ;;
    aarch64) _dir="mongodb_exporter-${pkgver}.linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/mongodb_exporter" "${pkgdir}/usr/bin/mongodb_exporter"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
