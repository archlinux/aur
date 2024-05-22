# Maintainer: Gilbert Gilb's <gilbsgilbert@gmail.com>
pkgname=riscv32-gnu-toolchain-elf-llvm-bin
pkgver=2024.04.12
pkgrel=1
pkgrel=1
pkgdesc="GNU toolchain for riscv32 ELF, including GCC and LLVM."
arch=('x86_64')
url="https://github.com/riscv-collab/riscv-gnu-toolchain"
license=('GPL2')
depends=()
conflicts=(
  'riscv32-gnu-toolchain-elf-bin'
)
optdepends=()
makedepends=()
options=(!strip)
source=(
  "https://github.com/riscv-collab/riscv-gnu-toolchain/releases/download/2024.04.12/riscv32-elf-ubuntu-22.04-llvm-nightly-2024.04.12-nightly.tar.gz"
)
sha512sums=(
  "c1d3b81b5c09ebcec447ffeaf2850c8636daa8d10f865ce004f183bc41aa71f5219c13322b2ba14d43a9ab95270aae682e6fb84bd444889953bc42ee4660ecb2"
)
_toolchain_prefix='riscv32-unknown-elf'

package() {
  install -dm755 "${pkgdir}"/opt/riscv32-gnu-toolchain-elf-llvm-bin "${pkgdir}"/usr/bin "${pkgdir}"/usr/lib/gcc
  cp -pR "${srcdir}"/riscv/* "${pkgdir}"/opt/riscv32-gnu-toolchain-elf-llvm-bin
  ln -s /opt/riscv32-gnu-toolchain-elf-llvm-bin "${pkgdir}"/usr/
  for f in "${srcdir}"/riscv/bin/"${_toolchain_prefix}"-*; do
    f="$(basename "${f}")"
    ln -s /opt/riscv32-gnu-toolchain-elf-llvm-bin/bin/"${f}" "${pkgdir}"/usr/bin
  done
  ln -s /opt/riscv32-gnu-toolchain-elf-llvm-bin/lib/gcc/"${_toolchain_prefix}" "${pkgdir}"/usr/lib/gcc
}