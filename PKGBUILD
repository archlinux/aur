# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=triviumdb-bin
pkgver=0.9.3
pkgrel=1
pkgdesc="Embedded database combining vector search, graph and document metadata"
arch=('x86_64' 'aarch64')
url="https://github.com/Astrmira/TriviumDB"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/triviumdb-server-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/triviumdb-server-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('1e7b322ffed6c074720a8436358b02bfac1910d2c0d8a9ba6b451965ef1ba87a')
sha256sums_aarch64=('279e167d672010c92503c24f6507aa69329a3d7e147258e9cf242696fe384a8c')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="triviumdb-server-v${pkgver}-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="triviumdb-server-v${pkgver}-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/triviumdb-server" "${pkgdir}/usr/bin/triviumdb-server"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
