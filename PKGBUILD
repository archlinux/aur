# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=jellysweep-bin
pkgver=0.16.2
pkgrel=1
pkgdesc="Smart cleanup tool for Jellyfin media servers"
arch=('x86_64' 'aarch64')
url="https://github.com/jon4hz/jellysweep"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/jellysweep-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/jellysweep-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('a21d1a5ccecfe978f7221d9649d87da742381dab6acde0c814ef5fa5a1ad48c2')
sha256sums_aarch64=('4ef7b7dd900edb9beca60dd1f4d1b223e5352696c5170cee949861815cdbf35a')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="jellysweep-v${pkgver}-linux-amd64" ;;
    aarch64) _dir="jellysweep-v${pkgver}-linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/jellysweep" "${pkgdir}/usr/bin/jellysweep"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
