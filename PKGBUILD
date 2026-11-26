# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sql_exporter-bin
pkgver=0.24.14
pkgrel=1
pkgdesc="Database-agnostic SQL exporter for Prometheus"
arch=('x86_64' 'aarch64')
url="https://github.com/burningalchemist/sql_exporter"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/sql_exporter-${pkgver}.linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/sql_exporter-${pkgver}.linux-arm64.tar.gz")
sha256sums_x86_64=('e6b7b08f48ccd4a30256e163c620810bf06c6d75d1aa21d83417b260ea3fac76')
sha256sums_aarch64=('af0bedbd24d4eeca0cce7a5520f97f762abd03e783d0a1d2f84c320ead932a30')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="sql_exporter-${pkgver}.linux-amd64" ;;
    aarch64) _dir="sql_exporter-${pkgver}.linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/sql_exporter" "${pkgdir}/usr/bin/sql_exporter"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
