# Maintainer: Gilbert Gilb's <gilbsgilbert@gmail.com>
pkgname=riscv32-gnu-toolchain-glibc-bin
pkgver=2024.04.12
pkgrel=4
pkgdesc="GNU toolchain for riscv32 linux, including GCC."
arch=('x86_64')
url="https://github.com/riscv-collab/riscv-gnu-toolchain"
license=('GPL2')
depends=()
conflicts=(
  'riscv32-gnu-toolchain-glibc-llvm-bin'
)
optdepends=()
makedepends=()
options=(!strip)
source=(
  "https://github.com/riscv-collab/riscv-gnu-toolchain/releases/download/2024.04.12/riscv32-glibc-ubuntu-22.04-gcc-nightly-2024.04.12-nightly.tar.gz"
)
sha512sums=(
  "07dc63c0644d810c1497cb846382ecb5aeaac6ae54bb663bed8ff1cdac86d6ae84ebcefb06104e45866db0bf5685e8493ee3e42cf6991e2fe39ae79ace5e26ff"
)
_toolchain_prefix='riscv32-unknown-linux-gnu'

package() {
  install -dm755 "${pkgdir}"/opt/riscv32-gnu-toolchain-glibc-bin "${pkgdir}"/usr/bin "${pkgdir}"/usr/lib/gcc
  cp -pR "${srcdir}"/riscv/* "${pkgdir}"/opt/riscv32-gnu-toolchain-glibc-bin
  ln -s /opt/riscv32-gnu-toolchain-glibc-bin/"${_toolchain_prefix}" "${pkgdir}"/usr
  for f in "${srcdir}"/riscv/bin/"${_toolchain_prefix}"-*; do
    f="$(basename "${f}")"
    ln -s /opt/riscv32-gnu-toolchain-glibc-bin/bin/"${f}" "${pkgdir}"/usr/bin
  done
  ln -s /opt/riscv32-gnu-toolchain-glibc-bin/lib/gcc/"${_toolchain_prefix}" "${pkgdir}"/usr/lib/gcc
}