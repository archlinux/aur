# Maintainer: Gilbert Gilb's <gilbsgilbert@gmail.com>
pkgname=riscv64-gnu-toolchain-elf-llvm-bin
pkgver=2024.04.12
pkgrel=4
pkgdesc="GNU toolchain for riscv64 ELF, including GCC and LLVM."
arch=('x86_64')
url="https://github.com/riscv-collab/riscv-gnu-toolchain"
license=('GPL2')
depends=()
conflicts=(
  'riscv64-gnu-toolchain-elf-bin'
)
provides=(
  'riscv64-gnu-toolchain-elf-bin'
)
optdepends=()
makedepends=()
options=(!strip)
source=(
  "https://github.com/riscv-collab/riscv-gnu-toolchain/releases/download/2024.04.12/riscv64-elf-ubuntu-22.04-llvm-nightly-2024.04.12-nightly.tar.gz"
)
sha512sums=(
  "0b5a852416667460d7ba2bfe9820577bfd5f52b9ab7145aafdced09d4f4619f09af0714c0d8df2a5aff2e89be2711db856b32caca51ff9780852c91c806e8ec0"
)
_toolchain_prefix='riscv64-unknown-elf'
_toolchain_prefix_alt='riscv64-unknown-unknown-elf'

package() {
  install -dm755 "${pkgdir}"/opt/riscv64-gnu-toolchain-elf-llvm-bin "${pkgdir}"/usr/bin "${pkgdir}"/usr/lib/gcc
  cp -pR "${srcdir}"/riscv/* "${pkgdir}"/opt/riscv64-gnu-toolchain-elf-llvm-bin
  ln -s /opt/riscv64-gnu-toolchain-elf-llvm-bin/"${_toolchain_prefix}" "${pkgdir}"/usr
  for f in "${srcdir}"/riscv/bin/"${_toolchain_prefix}"-*; do
    f="$(basename "${f}")"
    ln -s /opt/riscv64-gnu-toolchain-elf-llvm-bin/bin/"${f}" "${pkgdir}"/usr/bin
  done
  ln -s /opt/riscv64-gnu-toolchain-elf-llvm-bin/lib/gcc/"${_toolchain_prefix}" "${pkgdir}"/usr/lib/gcc

  # Also provide target quadruplet to prevent confusing clang
  ln -s "${_toolchain_prefix}" "${pkgdir}"/usr/"${_toolchain_prefix_alt}"
  ln -s "${_toolchain_prefix}" "${pkgdir}"/opt/riscv64-gnu-toolchain-elf-llvm-bin/"${_toolchain_prefix_alt}"
  ln -s "${_toolchain_prefix}" "${pkgdir}"/usr/lib/gcc/"${_toolchain_prefix_alt}"
  ln -s "${_toolchain_prefix}" "${pkgdir}"/opt/riscv64-gnu-toolchain-elf-llvm-bin/lib/gcc/"${_toolchain_prefix_alt}"
}