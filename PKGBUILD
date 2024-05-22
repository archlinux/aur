# Maintainer: Gilbert Gilb's <gilbsgilbert@gmail.com>
pkgname=riscv32-gnu-toolchain-glibc-llvm-bin
pkgver=2024.04.12
pkgrel=3
pkgrel=1
pkgdesc="GNU toolchain for riscv32 linux, including GCC and LLVM."
arch=('x86_64')
url="https://github.com/riscv-collab/riscv-gnu-toolchain"
license=('GPL2')
depends=()
conflicts=(
  'riscv32-gnu-toolchain-glibc-bin'
)
provides=(
  'riscv32-gnu-toolchain-glibc-bin'
)
optdepends=()
makedepends=()
options=(!strip)
source=(
  "https://github.com/riscv-collab/riscv-gnu-toolchain/releases/download/2024.04.12/riscv32-glibc-ubuntu-22.04-llvm-nightly-2024.04.12-nightly.tar.gz"
)
sha512sums=(
  "a276c9912ff94654b5224dabbd4c21be146332c714af3ad74150322dff9044311ada4aadc6d5c8a93fe703be675aeafa6b8310a902981cc1ed4b149ff5cfaed1"
)
_toolchain_prefix='riscv32-unknown-linux-gnu'

package() {
  install -dm755 "${pkgdir}"/opt/riscv32-gnu-toolchain-glibc-llvm-bin "${pkgdir}"/usr/bin "${pkgdir}"/usr/lib/gcc
  cp -pR "${srcdir}"/riscv/* "${pkgdir}"/opt/riscv32-gnu-toolchain-glibc-llvm-bin
  ln -s /opt/riscv32-gnu-toolchain-glibc-llvm-bin/"${_toolchain_prefix}" "${pkgdir}"/usr
  for f in "${srcdir}"/riscv/bin/"${_toolchain_prefix}"-*; do
    f="$(basename "${f}")"
    ln -s /opt/riscv32-gnu-toolchain-glibc-llvm-bin/bin/"${f}" "${pkgdir}"/usr/bin
  done
  ln -s /opt/riscv32-gnu-toolchain-glibc-llvm-bin/lib/gcc/"${_toolchain_prefix}" "${pkgdir}"/usr/lib/gcc
}