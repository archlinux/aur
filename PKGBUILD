# Maintainer: Gilbert Gilb's <gilbsgilbert@gmail.com>
pkgname=riscv32-gnu-toolchain-elf-bin
pkgver=2024.04.12
pkgrel=2
pkgrel=1
pkgdesc="GNU toolchain for riscv32 ELF, including GCC."
arch=('x86_64')
url="https://github.com/riscv-collab/riscv-gnu-toolchain"
license=('GPL2')
depends=()
conflicts=(
  'riscv32-gnu-toolchain-elf-llvm-bin'
)
optdepends=()
makedepends=()
options=(!strip)
source=(
  "https://github.com/riscv-collab/riscv-gnu-toolchain/releases/download/2024.04.12/riscv32-elf-ubuntu-22.04-gcc-nightly-2024.04.12-nightly.tar.gz"
)
sha512sums=(
  "0feef02f43e194bc693bd8a3c6189abbac3b91e840bcc8828fbc08455db8fa2ad2e3fcf1d6e2bf4ad7c8bbf6b0aed55692e6a56eaefbd3040d858f63a188b03e"
)
_toolchain_prefix='riscv32-unknown-elf'
_toolchain_prefix_alt='riscv32-unknown-unknown-elf'

package() {
  install -dm755 "${pkgdir}"/opt/riscv32-gnu-toolchain-elf-bin "${pkgdir}"/usr/bin "${pkgdir}"/usr/lib/gcc
  cp -pR "${srcdir}"/riscv/* "${pkgdir}"/opt/riscv32-gnu-toolchain-elf-bin
  ln -s /opt/riscv32-gnu-toolchain-elf-bin/"${_toolchain_prefix}" "${pkgdir}"/usr
  for f in "${srcdir}"/riscv/bin/"${_toolchain_prefix}"-*; do
    f="$(basename "${f}")"
    ln -s /opt/riscv32-gnu-toolchain-elf-bin/bin/"${f}" "${pkgdir}"/usr/bin
  done
  ln -s /opt/riscv32-gnu-toolchain-elf-bin/lib/gcc/"${_toolchain_prefix}" "${pkgdir}"/usr/lib/gcc

  # Also provide target quadruplet to prevent confusing clang
  ln -s "${_toolchain_prefix}" "${pkgdir}"/usr/"${_toolchain_prefix_alt}"
  ln -s "${_toolchain_prefix}" "${pkgdir}"/opt/riscv32-gnu-toolchain-elf-bin/"${_toolchain_prefix_alt}"
  ln -s "${_toolchain_prefix}" "${pkgdir}"/usr/lib/gcc/"${_toolchain_prefix_alt}"
  ln -s "${_toolchain_prefix}" "${pkgdir}"/opt/riscv32-gnu-toolchain-elf-bin/lib/gcc/"${_toolchain_prefix_alt}"
}