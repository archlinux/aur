# Maintainer: Olof Nord <aur@olof.info>

pkgname='hla-bin'
pkgver='2.16'
pkgrel='1'
pkgdesc='The High-Level Assembler for the 80x86 CPU'
provides=('hla')
conflicts=('hla')
arch=('x86_64' 'i686')
makedepends=('wget')
install="${pkgname}.install"
url="https://www.plantation-productions.com/Webster/HighLevelAsm"
license=('custom: Creative Commons 4.0 (by/attribution)')
source=("https://www.plantation-productions.com/Webster/HighLevelAsm/HLAv$pkgver/linux.hla.tar.gz")
sha256sums=('6c9a7773ed12a27d8ab4871e4b64544a56936db23c067230168f26178af2815c')

prepare() {
  # Fetch custom license file 
  wget -O "${srcdir}/LICENSE" 'https://creativecommons.org/licenses/by/4.0/legalcode.txt'
}

package() {
  install -D -m 755 "${srcdir}/usr/hla/delete" -t "${pkgdir}/usr/bin/hla/"
  install -D -m 755 "${srcdir}/usr/hla/hla" -t "${pkgdir}/usr/bin/hla/"
  install -D -m 755 "${srcdir}/usr/hla/hlacmp" -t "${pkgdir}/usr/bin/hla/"
  install -D -m 755 "${srcdir}/usr/hla/hlaparse" -t "${pkgdir}/usr/bin/hla/"
  install -D -m 755 "${srcdir}/usr/hla/makefile" -t "${pkgdir}/usr/bin/hla/"
  install -D -m 755 "${srcdir}/usr/hla/mkMake" -t "${pkgdir}/usr/bin/hla/"

  for file in $(find ${srcdir}/usr/hla/hlalib/ -type f -printf "%f\n"); do
    install -D -m 644 "${srcdir}/usr/hla/hlalib/${file}" -t "${pkgdir}/usr/bin/hla/hlalib/";
  done

  for file in $(find ${srcdir}/usr/hla/include/ -maxdepth 1 -type f -printf "%f\n"); do
    install -D -m 644 "${srcdir}/usr/hla/include/${file}" -t "${pkgdir}/usr/bin/hla/include/";
  done

  for file in $(find ${srcdir}/usr/hla/include/os/ -type f -printf "%f\n"); do
    install -D -m 644 "${srcdir}/usr/hla/include/os/${file}" -t "${pkgdir}/usr/bin/hla/include/os/";
  done

  # Install license
  install -D -m 644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
