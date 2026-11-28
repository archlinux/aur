# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=monbooru-bin
pkgver=1.24.1
pkgrel=1
pkgdesc="Self-hosted booru-style gallery for personal image collections"
arch=('x86_64' 'aarch64')
url="https://github.com/monbooru/monbooru"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/monbooru_${pkgver}_portable_lite_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/monbooru_${pkgver}_portable_lite_linux_arm64.tar.gz")
sha256sums_x86_64=('3b02d9a7fdc48e9531de4854ba11b57ecb5a8aebd6ebfa39bccb4b283b5b7d72')
sha256sums_aarch64=('65ff43d6dc10a54d8e563d5e9c631a2cf58742d4a5c47850d27b3cd5e2835dc0')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="monbooru_${pkgver}_portable_lite_linux_amd64" ;;
    aarch64) _dir="monbooru_${pkgver}_portable_lite_linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/monbooru" "${pkgdir}/usr/bin/monbooru"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
