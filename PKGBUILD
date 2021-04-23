# Maintainer: BienChen <binchan at gmx dot com>

pkgname=gcc-nuclei-bin
_pkgname=Nuclei-Toolchain
pkgver=2020.08
pkgrel=2
pkgdesc='GNU Compiler Collection for RISC-V processor from Nuclei System Technology  (official build).'
arch=('x86_64')
url='https://nucleisys.com/download.php'
license=('GPL LGPL FDL custom')
options=('!strip')
install="${pkgname}.install"
source=("https://nucleisys.com/upload/files/toochain/gcc/nuclei_riscv_newlibc_prebuilt_linux64_${pkgver}.tar.bz2")
sha256sums=('398c25b9385b8122d2e864bf71e47b1d871f6c326c21d0ae6d3afd2858f36041')
noextract=("nuclei_riscv_newlibc_prebuilt_linux64_${pkgver}.tar.bz2")

prepare() {
  mkdir -p "${srcdir}/opt/${_pkgname}"
  bsdtar -xf "nuclei_riscv_newlibc_prebuilt_linux64_${pkgver}.tar.bz2" \
         -C "${srcdir}/opt/${_pkgname}"
}

package() {
  mv "${srcdir}/opt" "${pkgdir}/"
  install -dm755 "${pkgdir}/usr/bin"
  cd "${pkgdir}/opt/${_pkgname}/gcc/bin"
  for file in *
  do
    ln -s "/opt/${_pkgname}/gcc/bin/$file" "${pkgdir}/usr/bin/"
  done
}
