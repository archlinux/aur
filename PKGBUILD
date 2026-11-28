# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=nzbfast-bin
pkgver=1.10.0
pkgrel=1
pkgdesc="Fast Usenet downloader"
arch=('x86_64' 'aarch64')
url="https://github.com/nzbfast/nzbfast"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/nzbfast-${pkgver}-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/nzbfast-${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('315963fa5a11fefbeef3d7a78a6ce86df7597ef7bfd1959139a84678b86f8592')
sha256sums_aarch64=('bc5775f146a435cec79c67b3de2551579012dbdd4f56b36a5c30a6e41bc44f2c')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="nzbfast-${pkgver}-linux-x64" ;;
    aarch64) _dir="nzbfast-${pkgver}-linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/nzbfast" "${pkgdir}/usr/bin/nzbfast"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
