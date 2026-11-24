# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=neosh-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="TUI agent orchestrator"
arch=('x86_64' 'aarch64')
url="https://github.com/neoswarm/neosh"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/neosh-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/neosh-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('9c95cb65d397e57c60c3b69a3985142f9ee69162cf55073694436f001fe06052')
sha256sums_aarch64=('d96c53a0936ecfac0a02d864573748a5225aa96dbea77dcf8a86c7f0b38a46bb')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="neosh-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="neosh-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/neosh" "${pkgdir}/usr/bin/neosh"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
