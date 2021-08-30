# Contributor: Sebastian Wolf <fatmike303 at gmail.com>
# Contributor: Serge <cuznez at gmail.com>
pkgname=gavrasm
pkgver=5.0
_pkgver=50
pkgrel=1
pkgdesc="Command line assembler for Atmel AVR microcontrollers with many extended features"
arch=(i686 x86_64)
license=("Custom")
url="http://www.avr-asm-tutorial.net/gavrasm"
makedepends=("fpc")
source=("http://www.avr-asm-tutorial.net/${pkgname}/v${_pkgver}/${pkgname}_sources_lin_${_pkgver}.zip")
sha256sums=('7ab6ea6b0f9c40592484d7bcd37aef83ab82799ef4ed8bba4769c91b2d5532bc')

build() {
  cd "${srcdir}"
  mv gavrlang_en.pas gavrlang.pas
  # Comment in above and uncomment one of the following lines for other language
  #mv gavrlang_de.pas gavrlang.pas
  #mv gavrlang_fr.pas gavrlang.pas
  #mv gavrlang_tr.pas gavrlang.pas
  fpc gavrasm.pas || return 1
}

package() {
  cd "${srcdir}"
  install -D gavrasm ${pkgdir}/usr/bin/gavrasm
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  sed -n '/Terms of use/,/ error file./p' ReadMe.Txt > ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
