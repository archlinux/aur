# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=boflink-bin
pkgver=0.6.3
pkgrel=1
pkgdesc="Linker for Beacon Object Files"
arch=('x86_64' 'aarch64')
url="https://github.com/MEhrn00/boflink"
license=('BSD-3-Clause')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/boflink-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/boflink-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('9e4e88185ceee61cfc959dfd572ed22619301b76db47a357ebc9b766364f9c00')
sha256sums_aarch64=('f18491cdaa2f56d90050f649e6dc97ec1564a5c86101b2e565aaf46dbe78835e')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="boflink-v${pkgver}-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="boflink-v${pkgver}-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/boflink" "${pkgdir}/usr/bin/boflink"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
