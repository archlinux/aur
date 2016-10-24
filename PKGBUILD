# Maintainer: bill <wpkp34 on gmail>
pkgname=kmd-compile-aasm
pkgver=20120816
pkgrel=1
pkgdesc='ARM compiler for kmd (Komodo Manchester Debugger)'
arch=('i386' 'x86_64')
url='https://studentnet.cs.manchester.ac.uk/resources/software/komodo/assembler/'
license=('custom')
depends=('kmd')
makedepends=('git' 'gcc')

source=('aasm'::'git+https://github.com/UoMCS/aasm.git')

md5sums=('SKIP')

build() {
  cd "$srcdir/aasm"
  gcc aasm.c -o aasm
  cat << EOS > kmd_compile
#! /bin/sh
FNAME=`echo $1 | sed s/[.]s$//`
aasm -lk ${FNAME}.kmd $1
EOS
}

package() {
  cd "$srcdir/aasm"
  install -Dm755 aasm "$pkgdir/usr/bin/aasm"
  install -Dm755 kmd_compile "$pkgdir/usr/bin/kmd_compile"
}
