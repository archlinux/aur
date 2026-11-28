# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=pgbackrest_exporter-bin
pkgver=0.25.0
pkgrel=1
pkgdesc="Prometheus exporter for pgBackRest"
arch=('x86_64' 'aarch64')
url="https://github.com/woblerr/pgbackrest_exporter"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/pgbackrest_exporter-${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/pgbackrest_exporter-${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('d0372c14757fb8590e7275401c6aeb36909bebf6135c1d72039547a8d3321054')
sha256sums_aarch64=('4d18143573f181981b7cc886b5bd5c91c4079167acba7660c5e1fb585db10876')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="pgbackrest_exporter-${pkgver}-linux-x86_64" ;;
    aarch64) _dir="pgbackrest_exporter-${pkgver}-linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/pgbackrest_exporter" "${pkgdir}/usr/bin/pgbackrest_exporter"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
