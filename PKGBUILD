# Contributor: Sebastian Wolf <fatmike303 at gmail.com>
# Contributor: Serge <cuznez at gmail.com>
pkgname=gavrasm
pkgver=5.4
_pkgver=54
pkgrel=1
pkgdesc="Command line assembler for Atmel AVR microcontrollers with many extended features"
arch=(i686 x86_64)
license=("Custom")
url="http://www.avr-asm-tutorial.net/gavrasm"
makedepends=("fpc")
source=("http://www.avr-asm-tutorial.net/${pkgname}/v${_pkgver}/${pkgname}_sources_lin_${_pkgver}.zip")
sha256sums=('ed1159287668a360f29d2d2f3ad2fa57ac33df8c76c4bd442edd8667c42c473d')

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
