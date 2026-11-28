# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=wesl-rs-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Compiler for WESL (WGSL Extended) shaders"
arch=('x86_64' 'aarch64')
url="https://github.com/webgpu-tools/wesl-rs"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/wesl-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/wesl-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('007f2a2b121e6a2805e30c3890d41b0aa5187d168c695dabc97751b91d55526a')
sha256sums_aarch64=('fb13870ae8d1626925e7ae5f82676cb174f774a2cd5f68d0b98441413f75e8e1')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="wesl-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="wesl-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/wesl" "${pkgdir}/usr/bin/wesl"
  install -Dm644 "${_dir}/LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${_dir}/LICENSE-APACHE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
