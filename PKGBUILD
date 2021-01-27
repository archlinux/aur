# Maintainer: Barnaby Gray <barnaby at pickle dot me dot uk>
pkgname=raspberry-pico-sdk-git
pkgver=1.0.0.r3.g0f3b795
pkgrel=1
pkgdesc="Raspberry Pico SDK "
arch=("any")
url="https://github.com/raspberrypi/pico-sdk"
license=('BSD-3')
source=(
	"git+https://github.com/raspberrypi/pico-sdk"
	"pico-sdk.sh"
	"pico-sdk.csh"
)
sha256sums=(
	'SKIP'
	'8610406fc529818eb2f67163e19a7204cda36f8cd7ed77fb4a65154918de3acb'
	'5d795a2d5de6046ad4bf196c912da4683e62779cac8dbcf90f20733470810e34'
)
depends=('arm-none-eabi-binutils' 'arm-none-eabi-gcc' 'arm-none-eabi-newlib' 'cmake')
optdepends=('arm-none-eabi-gdb')
makedepends=('git')
install="pico-sdk.install"

pkgver() {
    cd "${srcdir}/pico-sdk"
    git describe --tags --match '?.*' | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/pico-sdk"
  git submodule update --init
  mkdir -p "${pkgdir}/usr/share"
  cp -r "${srcdir}/pico-sdk" "${pkgdir}/usr/share/pico-sdk"
  install -Dm755 "${srcdir}/pico-sdk.sh" "${pkgdir}/etc/profile.d/pico-sdk.sh"
  install -Dm755 "${srcdir}/pico-sdk.csh" "${pkgdir}/etc/profile.d/pico-sdk.csh"
}
