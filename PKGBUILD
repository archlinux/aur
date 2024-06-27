# Maintainer: Vincent Bernardoff <vb AT luminar DOT eu DOT org>

pkgname=ngnk-git
pkgver=r4241.e4b2dc4d
pkgrel=1
pkgdesc="simple fast vector programming language"
arch=('armv7h' 'aarch64' 'i686' 'x86_64')
url="https://codeberg.org/ngn/k"
license=('AGPL3')
depends=()
source=('git+https://codeberg.org/ngn/k.git'
        'license.patch')
sha256sums=('SKIP'
            '61b833a1de88f9b737db7e089a2d1bca33ba70a11c3b8fb13b8afc273fe32558')

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
  make k libk.so
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
  install -Dm644 -t "$pkgdir/usr/include/" k.h
  install -Dm755 -t "$pkgdir/usr/lib/" libk.so
}
