# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=prom2json-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="Scrape a Prometheus client and dump the result as JSON"
arch=('x86_64' 'aarch64')
url="https://github.com/prometheus/prom2json"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/prom2json-${pkgver}.linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/prom2json-${pkgver}.linux-arm64.tar.gz")
sha256sums_x86_64=('5935363cc8c88360e3aa275ddc5a754ad95f6bab6b6052978e686300baa5a4d6')
sha256sums_aarch64=('9b60ac476ffb838e5eb80489394c0590254ff1303b9a0c83364ded2cfa5a7353')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="prom2json-${pkgver}.linux-amd64" ;;
    aarch64) _dir="prom2json-${pkgver}.linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/prom2json" "${pkgdir}/usr/bin/prom2json"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
