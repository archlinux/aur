# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=lindb-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="Scalable, highly available distributed time series database"
arch=('x86_64' 'aarch64')
url="https://github.com/lindb/lindb"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/lindb/lindb/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/lindb-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/lindb-v${pkgver}-linux-arm64.tar.gz")
sha256sums=('e6228e6ea7458dcf3972af69e50170914b874b79ffed272b0860f9beb6289e28')
sha256sums_x86_64=('425bbf90a82f37ce8f13c9c030941d7b5a6818dff559d2ef5ff8a46153eee512')
sha256sums_aarch64=('2e8dc2a13c8bcf6f8accc3789000cfc1fadf54248a36466974fbddb3a39a4380')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="lindb-v${pkgver}-linux-amd64" ;;
    aarch64) _dir="lindb-v${pkgver}-linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/lind-cli" "${pkgdir}/usr/bin/lind-cli"
  install -Dm755 "${_dir}/lind" "${pkgdir}/usr/bin/lind"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
