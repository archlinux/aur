# Maintainer: Gilbert Gilb's <gilbsgilbert@gmail.com>
pkgname=riscv64-gnu-toolchain-elf-bin
pkgver=2024.04.12
pkgrel=4
pkgdesc="GNU toolchain for riscv64 ELF, including GCC."
arch=('x86_64')
url="https://github.com/riscv-collab/riscv-gnu-toolchain"
license=('GPL2')
depends=()
conflicts=(
  'riscv64-gnu-toolchain-elf-llvm-bin'
)
optdepends=()
makedepends=()
options=(!strip)
source=(
  "https://github.com/riscv-collab/riscv-gnu-toolchain/releases/download/2024.04.12/riscv64-elf-ubuntu-22.04-gcc-nightly-2024.04.12-nightly.tar.gz"
)
sha512sums=(
  "cabdfda0410d2b8a8de0ba7879174b4d240675adaa45fc95c4c807859fed176d5d4309fbaa278887533000b1dd96ebedc9e1b5bf140a50743de4fa613c7028ac"
)
_toolchain_prefix='riscv64-unknown-elf'
_toolchain_prefix_alt='riscv64-unknown-unknown-elf'

package() {
  install -dm755 "${pkgdir}"/opt/riscv64-gnu-toolchain-elf-bin "${pkgdir}"/usr/bin "${pkgdir}"/usr/lib/gcc
  cp -pR "${srcdir}"/riscv/* "${pkgdir}"/opt/riscv64-gnu-toolchain-elf-bin
  ln -s /opt/riscv64-gnu-toolchain-elf-bin/"${_toolchain_prefix}" "${pkgdir}"/usr
  for f in "${srcdir}"/riscv/bin/"${_toolchain_prefix}"-*; do
    f="$(basename "${f}")"
    ln -s /opt/riscv64-gnu-toolchain-elf-bin/bin/"${f}" "${pkgdir}"/usr/bin
  done
  ln -s /opt/riscv64-gnu-toolchain-elf-bin/lib/gcc/"${_toolchain_prefix}" "${pkgdir}"/usr/lib/gcc

  # Also provide target quadruplet to prevent confusing clang
  ln -s "${_toolchain_prefix}" "${pkgdir}"/usr/"${_toolchain_prefix_alt}"
  ln -s "${_toolchain_prefix}" "${pkgdir}"/opt/riscv64-gnu-toolchain-elf-bin/"${_toolchain_prefix_alt}"
  ln -s "${_toolchain_prefix}" "${pkgdir}"/usr/lib/gcc/"${_toolchain_prefix_alt}"
  ln -s "${_toolchain_prefix}" "${pkgdir}"/opt/riscv64-gnu-toolchain-elf-bin/lib/gcc/"${_toolchain_prefix_alt}"
}