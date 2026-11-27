# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=fast-anything-bin
pkgver=0.8.9
pkgrel=1
pkgdesc="Don't rewrite it in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/EL4CTEO/fast-anything"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/fast-anything-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/fast-anything-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('d44d7636d6199ba101ebcae62906c7b7864f0d92931d0c430c2622ebe850da48')
sha256sums_aarch64=('99922e5d37fdcfcec4447a310235ba0ea187af49dc2e6223ada697834869db27')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="fast-anything-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="fast-anything-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/fast-anything" "${pkgdir}/usr/bin/fast-anything"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
