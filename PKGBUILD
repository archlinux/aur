# Maintainer: Vincent Bernardoff <vb AT luminar DOT eu DOT org>

pkgname=ngnk-git
pkgver=r3111.ba0e0ba
pkgrel=1
pkgdesc="simple fast vector programming language"
arch=('armv7h' 'aarch64' 'i686' 'x86_64')
url="https://codeberg.org/ngn/k"
license=('AGPL3')
depends=()
source=('git+https://codeberg.org/ngn/k.git'
        'license.patch')
sha256sums=('SKIP'
            '35eeb5c22ee06ccebfdc93632962166978f4b3a809321b4231aed04ce6c0ac12')

pkgver() {
  cd k
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd k
  patch < ../../license.patch
}

build() {
  cd k
  make k-libc
}

check() {
  cd k
  make t
}

package() {
  cd k
  install -Dm755 k "$pkgdir/usr/bin/ngnk"
  install -Dm644 -t "$pkgdir/usr/lib/ngnk/" repl.k
  install -Dm644 -t "$pkgdir/usr/lib/ngnk/" g.k
}
