# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=talos-pilot-bin
pkgver=0.1.11
pkgrel=1
pkgdesc="TUI for Talos Linux node monitoring, logs and etcd health"
arch=('x86_64' 'aarch64')
url="https://github.com/handfish/talos-pilot"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/talos-pilot-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/talos-pilot-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('719a94cd237caa10fe08d150f87a913f4349ec536094828c614513bb6bd25252')
sha256sums_aarch64=('9d6a362a1cb24d735cb61bfe5fbb68f09dc5fa39951fc0411863cb4d8d1ee48e')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="talos-pilot-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="talos-pilot-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/talos-pilot" "${pkgdir}/usr/bin/talos-pilot"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
