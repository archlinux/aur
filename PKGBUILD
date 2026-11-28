# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=fuelup-bin
pkgver=0.28.1
pkgrel=1
pkgdesc="Fuel toolchain installer"
arch=('x86_64' 'aarch64')
url="https://github.com/FuelLabs/fuelup"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/FuelLabs/fuelup/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/fuelup-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/fuelup-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('21963231109c9949fa26f7c9c47734d5ea1801f5388acd76cb188fbf2a8377dd')
sha256sums_aarch64=('4fcc7b93acbb4919581f5574f490c9d9ae46ad9067000bd35c4354d5ec0b40a2')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="fuelup-${pkgver}-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="fuelup-${pkgver}-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/fuelup" "${pkgdir}/usr/bin/fuelup"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
