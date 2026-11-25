# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=fast-anything-bin
pkgver=0.8.7
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
sha256sums_x86_64=('4ed748cffa0cd43116a33d44ad1a4851db09482c98ec8d4c3363828af12d1d04')
sha256sums_aarch64=('52a97b890484ebcc4085f492631b23475ef87d014f603c25f07eaee877965b86')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="fast-anything-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="fast-anything-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/fast-anything" "${pkgdir}/usr/bin/fast-anything"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
