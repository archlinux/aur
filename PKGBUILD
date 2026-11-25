# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=vtui-bin
pkgver=0.2.10
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
sha256sums_x86_64=('111c0b77c6f80432ce5df89c09718935b1a2aff923cc18c7ad22479dfbea9fa5')
sha256sums_aarch64=('d9912f6ac667d21ab24699e2533a0273af5243e21ea65a330b5825bd704a1708')

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
