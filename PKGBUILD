# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=safe-anything-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Security scanner for code vulnerabilities, secrets, configs and dependencies"
arch=('x86_64' 'aarch64')
url="https://github.com/erkamyaman/safe-anything"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/safe-anything-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/safe-anything-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('8364f838b09ee48df93744ca46008c6c0e50ba869828a00b8af14526de1000be')
sha256sums_aarch64=('751148f921aba80d1de80e97bfc3cecb4ca957252ae775bcea0dc3c6cc6fde37')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="safe-anything-v${pkgver}-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="safe-anything-v${pkgver}-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/safe-anything" "${pkgdir}/usr/bin/safe-anything"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
