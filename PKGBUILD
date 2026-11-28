# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=luacad-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="Parametric CAD modeling with Lua"
arch=('x86_64' 'aarch64')
url="https://github.com/ad-si/LuaCAD"
license=('AGPL-3.0-only')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/ad-si/LuaCAD/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/luacad-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/luacad-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0')
sha256sums_x86_64=('6264041dbfc2aabb0d59f90ecf8176dfbf020b7ca11baccfb073b8f97c516220')
sha256sums_aarch64=('06ac6dc6fbcb5c9e751e181be4093c862b018b81c2067d12d43ac19adcf2d87a')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="luacad-${pkgver}-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="luacad-${pkgver}-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/luacad-studio" "${pkgdir}/usr/bin/luacad-studio"
  install -Dm755 "${_dir}/luacad" "${pkgdir}/usr/bin/luacad"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
