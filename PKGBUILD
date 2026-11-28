# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=fast-anything-bin
pkgver=0.9.0
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
sha256sums_x86_64=('34d870022b873c4e8dbb800ab8e89c0a054d1a1b8ed121167f7bf4c486f42fbb')
sha256sums_aarch64=('0c6b101ed771132540f209f955229d297866155acd3c437bae27adc02d6f060a')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="fast-anything-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="fast-anything-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/fast-anything" "${pkgdir}/usr/bin/fast-anything"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
