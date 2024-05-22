# Maintainer: Gilbert Gilb's <gilbsgilbert@gmail.com>
pkgname=riscv64-gnu-toolchain-glibc-llvm-bin
pkgver=2024.04.12
pkgrel=4
pkgdesc="GNU toolchain for riscv64 linux, including GCC and LLVM."
arch=('x86_64')
url="https://github.com/riscv-collab/riscv-gnu-toolchain"
license=('GPL2')
depends=()
conflicts=(
  'riscv64-gnu-toolchain-glibc-bin'
)
provides=(
  'riscv64-gnu-toolchain-glibc-bin'
)
optdepends=()
makedepends=()
options=(!strip)
source=(
  "https://github.com/riscv-collab/riscv-gnu-toolchain/releases/download/2024.04.12/riscv64-glibc-ubuntu-22.04-llvm-nightly-2024.04.12-nightly.tar.gz"
)
sha512sums=(
  "318da38ec7705c29d0dcf16f0f482ee83d08bb8bbfb62a706900aeb57108bc2d9c1ea71479d92de19527417d99cb32da17ad8652b332fef62881552391aae9e9"
)
_toolchain_prefix='riscv64-unknown-linux-gnu'

package() {
  install -dm755 "${pkgdir}"/opt/riscv64-gnu-toolchain-glibc-llvm-bin "${pkgdir}"/usr/bin "${pkgdir}"/usr/lib/gcc
  cp -pR "${srcdir}"/riscv/* "${pkgdir}"/opt/riscv64-gnu-toolchain-glibc-llvm-bin
  ln -s /opt/riscv64-gnu-toolchain-glibc-llvm-bin/"${_toolchain_prefix}" "${pkgdir}"/usr
  for f in "${srcdir}"/riscv/bin/"${_toolchain_prefix}"-*; do
    f="$(basename "${f}")"
    ln -s /opt/riscv64-gnu-toolchain-glibc-llvm-bin/bin/"${f}" "${pkgdir}"/usr/bin
  done
  ln -s /opt/riscv64-gnu-toolchain-glibc-llvm-bin/lib/gcc/"${_toolchain_prefix}" "${pkgdir}"/usr/lib/gcc
}