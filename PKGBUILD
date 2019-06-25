# Maintainer: Jiuyang Liu <liujiuyang1994@gmail.com>

pkgname=riscv-tests-git
pkgver=1
pkgrel=1
pkgdesc='Hosts unit tests for RISC-V processors.'
arch=('x86_64')
url='https://github.com/riscv/riscv-tests'
license=('GPL')
makedepends=('riscv-sifive-elf-gcc' 'git')
source=("$pkgname::git+https://github.com/riscv/riscv-tests")
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  git submodule update --init --recursive
  autoconf
}

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr/riscv-sifive-elf
  make RISCV_PREFIX=riscv-sifive-elf-
}

package() {
  cd "$srcdir/$pkgname"
  make install instbasedir=$pkgdir/usr/riscv-sifive-elf
}
