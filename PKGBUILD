# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gotiler-bin
pkgver=3.2.0
pkgrel=1
pkgdesc="Convert LAS, LAZ, E57 and PLY point clouds to OGC 3D Tiles"
arch=('x86_64' 'aarch64')
url="https://github.com/mfbonfigli/gotiler"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/gotiler-linux-amd64-v${pkgver}.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/gotiler-linux-arm64-v${pkgver}.tar.gz")
sha256sums_x86_64=('662fbe85811a3aa56580077c89ea597654e59f88ac07b149a65f346c4d97771f')
sha256sums_aarch64=('a83979c769d06b52754cdedbc53ae52319a54355e0f4f53dd09025e92f6eec9e')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="gotiler-linux-amd64-v${pkgver}" ;;
    aarch64) _dir="gotiler-linux-arm64-v${pkgver}" ;;
  esac
  install -Dm755 "${_dir}/gotiler" "${pkgdir}/usr/bin/gotiler"
  install -Dm644 "${_dir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
