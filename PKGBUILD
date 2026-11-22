# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=hedos-bin
pkgver=1.6.1
pkgrel=1
pkgdesc="A terminal shelf for the local AI models already on your machine"
arch=('x86_64' 'aarch64')
url="https://github.com/theiskaa/hedos"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/hedos-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/hedos-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('14efc11708724282cf72a5aab2ccf6e019cad656f5413d0adce3a1d9f3d2d81f')
sha256sums_aarch64=('22f2fce1ca54a4179aaece13a91a1e0d17c31bd96b260347d9cae6d0778f052c')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="hedos-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="hedos-aarch64-unknown-linux-gnu" ;;
  esac
  cd "$_dir"
  install -Dm755 "hedos" "${pkgdir}/usr/bin/hedos"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
