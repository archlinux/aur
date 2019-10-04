# Contributor: Sebastian Wolf <fatmike303 at gmail.com>
# Contributor: Serge <cuznez at gmail.com>
pkgname=gavrasm
pkgver=4.3
_pkgver=43
pkgrel=1
pkgdesc="Command line assembler for Atmel AVR microcontrollers with many extended features"
arch=(i686 x86_64)
license=("Custom")
url="http://www.avr-asm-tutorial.net/gavrasm"
makedepends=("fpc")
source=("http://www.avr-asm-tutorial.net/${pkgname}/v${_pkgver}/${pkgname}_sources_lin_${_pkgver}.zip")
sha256sums=('1dac3d690c1d47db260705d0a34431dfd28a597d4f5d8999619d69806cfad65e')

build() {
  cd "${srcdir}"/Sourcefiles_v${_pkgver}
  mv gavrlang_en.pas gavrlang.pas
  # Comment in above and uncomment one of the following lines for other language
  #mv gavrlang_de.pas gavrlang.pas
  #mv gavrlang_fr.pas gavrlang.pas
  #mv gavrlang_tr.pas gavrlang.pas
  fpc gavrasm.pas || return 1
}

package() {
  cd "${srcdir}"/Sourcefiles_v${_pkgver}
  install -D gavrasm ${pkgdir}/usr/bin/gavrasm
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  sed -n '/Terms of use/,/ error file./p' ReadMe.Txt > ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
