# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=wanaku-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="Governed action proxy for AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/wanaku-ai/wanaku"
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'openssl-3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/wanaku-server-${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/wanaku-server-${pkgver}-linux-aarch64.tar.gz")
sha256sums_x86_64=('65f0bb4b3050393de7c1cfdf22b568401fcaee1d624a77217b1321b5a574cf04')
sha256sums_aarch64=('13cc46e5c0e31ff66e2942c1c47b39c45535c3d9ddcc1471a8e2b4312facfc60')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="wanaku-server-${pkgver}-linux-x86_64" ;;
    aarch64) _dir="wanaku-server-${pkgver}-linux-aarch64" ;;
  esac
  install -Dm755 "${_dir}/wanaku-server" "${pkgdir}/usr/bin/wanaku-server"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
