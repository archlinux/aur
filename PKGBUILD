# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cadmpeg-bin
pkgver=0.6.12
pkgrel=1
pkgdesc="Convert between CAD formats"
arch=('x86_64' 'aarch64')
url="https://github.com/cadmpeg/cadmpeg"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/cadmpeg-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/cadmpeg-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('88366e96420481830911f7d390575fd871d8ee2488bf430b3700f46a67343305')
sha256sums_aarch64=('d50be20395f01e0d57dd4404caac385d87a53dd49e585ee2b13ac2d64f88f7d9')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="cadmpeg-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="cadmpeg-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/cadmpeg" "${pkgdir}/usr/bin/cadmpeg"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${_dir}/LICENSE-docs" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
