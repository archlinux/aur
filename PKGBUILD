# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=crossuo-bin
pkgver=2.0.5
pkgrel=1
pkgdesc="Open-source Ultima Online client"
arch=('x86_64' 'aarch64')
url="https://github.com/crossuo/crossuo"
license=('AGPL-3.0-only')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/crossuo/crossuo/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/crossuo-linux-x64-v${pkgver}.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/crossuo-linux-arm64-v${pkgver}.tar.gz")
sha256sums=('e9df4c4e4e64b8168a71c3c67668dcffabbe8fca11d4ac4a7d5482562cd1679c')
sha256sums_x86_64=('2aa9bce9404190892298d5621d6c80ffd8e6c6c53facec1c562e8bd1b23a0109')
sha256sums_aarch64=('477710cef76d0f5b16b8fe146aec9e13656636a60e6cceac0d016845f6b6ecca')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="linux-x64" ;;
    aarch64) _dir="linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/crossuo" "${pkgdir}/usr/bin/crossuo"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
