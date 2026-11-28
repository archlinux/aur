# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=esp-emulator-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Emulator for ESP32 series SoCs"
arch=('x86_64' 'aarch64')
url="https://github.com/espressif/esp-emulator"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/espressif/esp-emulator/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/esp-emu-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/esp-emu-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('b4b7a4b5b02aae918514518d9163852ec54b4b4fcf40ded7e9d51e04801feac2')
sha256sums_aarch64=('572b5078b4a12079d0727127f24951a2175de769e750cf5a7ca04289856a033e')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="esp-emu-${pkgver}-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="esp-emu-${pkgver}-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/esp-emu" "${pkgdir}/usr/bin/esp-emu"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
