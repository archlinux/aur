# Maintainer: Gilbert Gilb's <gilbsgilbert@gmail.com>
pkgname=riscv64-gnu-toolchain-glibc-bin
pkgver=2024.04.12
pkgrel=4
pkgdesc="GNU toolchain for riscv64 linux, including GCC."
arch=('x86_64')
url="https://github.com/riscv-collab/riscv-gnu-toolchain"
license=('GPL2')
depends=()
conflicts=(
  'riscv64-gnu-toolchain-glibc-llvm-bin'
)
optdepends=()
makedepends=()
options=(!strip)
source=(
  "https://github.com/riscv-collab/riscv-gnu-toolchain/releases/download/2024.04.12/riscv64-glibc-ubuntu-22.04-gcc-nightly-2024.04.12-nightly.tar.gz"
)
sha512sums=(
  "d794bef40b81abd6246af2ee09195c544c13e3624574ed4b21861766d07d4d87852545bc9cf19b523a30d4dc237193d85570fc0804ed7571cb17e11f1f2babc3"
)
_toolchain_prefix='riscv64-unknown-linux-gnu'

package() {
  install -dm755 "${pkgdir}"/opt/riscv64-gnu-toolchain-glibc-bin "${pkgdir}"/usr/bin "${pkgdir}"/usr/lib/gcc
  cp -pR "${srcdir}"/riscv/* "${pkgdir}"/opt/riscv64-gnu-toolchain-glibc-bin
  ln -s /opt/riscv64-gnu-toolchain-glibc-bin/"${_toolchain_prefix}" "${pkgdir}"/usr
  for f in "${srcdir}"/riscv/bin/"${_toolchain_prefix}"-*; do
    f="$(basename "${f}")"
    ln -s /opt/riscv64-gnu-toolchain-glibc-bin/bin/"${f}" "${pkgdir}"/usr/bin
  done
  ln -s /opt/riscv64-gnu-toolchain-glibc-bin/lib/gcc/"${_toolchain_prefix}" "${pkgdir}"/usr/lib/gcc
}