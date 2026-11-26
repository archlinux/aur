# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=pgmetrics-bin
pkgver=1.19.1
pkgrel=1
pkgdesc="Collect and display statistics from a running PostgreSQL server"
arch=('x86_64' 'aarch64')
url="https://github.com/rapidloop/pgmetrics"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/pgmetrics_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/pgmetrics_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('43a1f1918d96ac973f366b6c9c3bdc972052daa3d7082107db6aa088b347beee')
sha256sums_aarch64=('1529d1a492f8078d4d4199d6a25b5dd7ccba6e5a7140f5ec997cd29ae756b81f')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="pgmetrics_${pkgver}_linux_amd64" ;;
    aarch64) _dir="pgmetrics_${pkgver}_linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/pgmetrics" "${pkgdir}/usr/bin/pgmetrics"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
