# Maintainer: ultraviolet <ultravioletnanokitty@gmail.com>

pkgname=crasm-git
_pkgname="crasm"
pkgver=r42.bc0b7a4
pkgrel=1
pkgdesc="Cross assembler for 6800/6801/6803/6502/65C02/Z80"
arch=('i686' 'x86_64')
url="https://github.com/colinbourassa/crasm"
license=('GPLv2+')
makedepends=('git')
source=("git+https://github.com/colinbourassa/crasm.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  make all
  gzip crasm.1
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm0755 src/crasm "$pkgdir/usr/bin/crasm"
  install -Dm0644 crasm.1.gz "$pkgdir/usr/share/man/man1/crasm.1.gz"
}
