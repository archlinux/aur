# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mobicat-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="View one app's Android and iOS simulator logs with the same keys and filters, with crashes grouped"
arch=('x86_64' 'aarch64')
url="https://github.com/yamamoto7/mobicat"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/mobicat-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/mobicat-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('26784b9843e96aaf61783b3bb264b6189f6df5e11852580fe4040888b0cbc886')
sha256sums_aarch64=('b0f04e3c221035794e189d8d798a366a8453d8eff46df719e78dd0f4f9a1328f')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="mobicat-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="mobicat-aarch64-unknown-linux-gnu" ;;
  esac
  cd "$_dir"
  install -Dm755 "mobicat" "${pkgdir}/usr/bin/mobicat"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
