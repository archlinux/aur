# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=oxish-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Memory-safe SSH server"
arch=('x86_64' 'aarch64')
url="https://github.com/djc/oxish"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/oxish-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/oxish-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('8cf61f870b81f9c0a575f0229529e8a54c3f7a1a74d951be461cc0a3b1bf6355')
sha256sums_aarch64=('1399e22acfb99811ad82603944921d0d138f5301155b24d24c051fc3bfb4c6a2')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="oxish-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="oxish-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/oxish-session" "${pkgdir}/usr/bin/oxish-session"
  install -Dm755 "${_dir}/oxish-server" "${pkgdir}/usr/bin/oxish-server"
  install -Dm644 "${_dir}/LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${_dir}/LICENSE-APACHE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
