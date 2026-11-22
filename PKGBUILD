# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=vtui-bin
pkgver=0.2.9
pkgrel=1
pkgdesc="Explore vSphere in style, with vCenter and ESXi both included"
arch=('x86_64' 'aarch64')
url="https://github.com/noclue/vtui"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/vtui-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/vtui-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('9d7b482ac4e67d597754e8123904a184b9dccea0ab0f47bbb07156afc848284f')
sha256sums_aarch64=('35ecdcd5edef722fdf587a50d085d39210a06ad4f6f980b725a30fbcb00b998e')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="vtui-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="vtui-aarch64-unknown-linux-gnu" ;;
  esac
  cd "$_dir"
  install -Dm755 "vtui" "${pkgdir}/usr/bin/vtui"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
