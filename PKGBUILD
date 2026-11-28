# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=fuel-core-bin
pkgver=0.48.4
pkgrel=1
pkgdesc="Full node for the Fuel v2 blockchain protocol"
arch=('x86_64' 'aarch64')
url="https://github.com/FuelLabs/fuel-core"
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/FuelLabs/fuel-core/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/fuel-core-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/fuel-core-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('817437b82cb87cb9e947dd8874df2c174878185901ef83617385b0f0824d16e2')
sha256sums_x86_64=('8ef210c3bced9ad41a34f96ed74b2f73e7e0fbc82bc2a04a159b3edf271b810d')
sha256sums_aarch64=('0b146220f988945940a90c43475fdf72d63916defad547dfaa6574db5dc607aa')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="fuel-core-${pkgver}-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="fuel-core-${pkgver}-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/fuel-core" "${pkgdir}/usr/bin/fuel-core"
  install -Dm755 "${_dir}/fuel-core-keygen" "${pkgdir}/usr/bin/fuel-core-keygen"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
