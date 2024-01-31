# Maintainer: Popolon <popolon at popolon dot org>

pkgname=libriscv
pkgver=1.1
pkgrel=1
pkgdesc='RISC-V userspace emulator library'
arch=('i686' 'x86_64' 'armv7h' 'aarch64' 'riscv32' 'riscv64')
url='https://github.com/fwsGonzo/libriscv'
license=('BSD-3-Clause')
#depends=(
#  'cmake'
#)
makedepends=(
  'cmake'
)
optdepends=(
  'riscv64-linux-gnu-gcc: compiling softwares for risc-v architecture'
  'clang: compiling softwares for various architectures including risc-v'
  'riscv64-linux-gnu-gdb: gnu debugger risc-v version'
)

source=(${pkgname}-${pkgver}.tar.gz::https://github.com/fwsGonzo/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('b172a2f1d06049bccf86e5795d3e7fa6c84b09491e5859f5ac35c34b44b21851')

build(){
 # lib
  cmake -B build -S ${pkgname}-${pkgver} \
     -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
 # cli
  cmake -B build-cli -S ${pkgname}-${pkgver}/emulator \
     -DCMAKE_INSTALL_PREFIX=/usr
  make -C build-cli


}
package(){
  make -C build DESTDIR="${pkgdir}/" install
  install -Dm755 build-cli/rvlinux ${pkgdir}/usr/bin/rvlinux
}
