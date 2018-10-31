# Contributor: Sebastian Wolf <fatmike303 at gmail.com>
# Contributor: Serge <cuznez at gmail.com>
pkgname=gavrasm
pkgver=4.0
_pkgver=40
pkgrel=1
pkgdesc="Command line assembler for Atmel AVR microcontrollers with many extended features"
arch=(i686 x86_64)
license=("Custom")
url="http://www.avr-asm-tutorial.net/gavrasm"
makedepends=("fpc")
source=("http://www.avr-asm-tutorial.net/${pkgname}/v${_pkgver}/${pkgname}_sources_lin_${_pkgver}.zip")
sha256sums=('24b43bb44062c2e8a9ec6f67244154f029521890e100fba02f74d3bd02cb90ff')

build() {
  cd "${srcdir}/Sourcefiles_v${_pkgver}"
  ln -s gavrlang_en.pas gavrlang.pas
  fpc gavrasm.pas || return 1
}

package() {
  cd "${srcdir}/Sourcefiles_v${_pkgver}"
  install -D gavrasm ${pkgdir}/usr/bin/gavrasm
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  sed -n '/Terms of use/,/ error file./p' ReadMe.Txt > ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
