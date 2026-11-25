# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=pgwatch-bin
pkgver=6.2.0
pkgrel=1
pkgdesc="PostgreSQL metrics monitor and dashboard"
arch=('x86_64' 'aarch64')
url="https://github.com/cybertec-postgresql/pgwatch"
license=('BSD-3-Clause')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/cybertec-postgresql/pgwatch/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/pgwatch_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/pgwatch_Linux_arm64.tar.gz")
sha256sums=('99af76c98e5a4bd5420840a4edc369dc02c99cafb99cb4bf2f5feddd076617e7')
sha256sums_x86_64=('8c61a80eb7a68023896029c339b83c1938c557e94ce9aba6140e86b3788c1e51')
sha256sums_aarch64=('9f79e5addf89c89f417c2af3e8463ac81fba6da60f735601d1f7528fbed4e256')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="pgwatch_Linux_x86_64" ;;
    aarch64) _dir="pgwatch_Linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/pgwatch" "${pkgdir}/usr/bin/pgwatch"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
