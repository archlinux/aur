# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=apache_exporter-bin
pkgver=1.1.3
pkgrel=1
pkgdesc="Prometheus exporter for Apache"
arch=('x86_64' 'aarch64')
url="https://github.com/Lusitaniae/apache_exporter"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/apache_exporter-${pkgver}.linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/apache_exporter-${pkgver}.linux-arm64.tar.gz")
sha256sums_x86_64=('85fa93e4495d5cc8eaec8d43fe530605f30dd9a08b4e0f4852507207fe86037a')
sha256sums_aarch64=('3e9574a9799e7781fbb91a37517518daf87232b2d68ff4c27c9cba78b507e57a')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="apache_exporter-${pkgver}.linux-amd64" ;;
    aarch64) _dir="apache_exporter-${pkgver}.linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/apache_exporter" "${pkgdir}/usr/bin/apache_exporter"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
