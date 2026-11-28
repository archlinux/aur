# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=stackdriver_exporter-bin
pkgver=0.19.0
pkgrel=1
pkgdesc="Prometheus exporter for Google Stackdriver"
arch=('x86_64' 'aarch64')
url="https://github.com/prometheus-community/stackdriver_exporter"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/stackdriver_exporter-${pkgver}.linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/stackdriver_exporter-${pkgver}.linux-arm64.tar.gz")
sha256sums_x86_64=('c2f930545dce5d275310a00f332d45a1810601d966698e1f14606faf23e59516')
sha256sums_aarch64=('056b59ef73e3fd715e5b79606a09e182e902ce8b6f4307801d69be170fe101b5')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="stackdriver_exporter-${pkgver}.linux-amd64" ;;
    aarch64) _dir="stackdriver_exporter-${pkgver}.linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/stackdriver_exporter" "${pkgdir}/usr/bin/stackdriver_exporter"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
