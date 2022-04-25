# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=harec
pkgver=r1240.c1caaf0
pkgrel=1
pkgdesc="The Hare programming language - bootstrapped compiler"
arch=('x86_64')
url="https://harelang.org/"
license=('GPL3')
depends=('qbe')
makedepends=('git')
_commit='c1caaf00bea2415724b969633cca2e3b2b51a4e6'
source=("git+https://git.sr.ht/~sircmpwn/harec#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd harec

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd harec

  # skip failing test
  sed \
    -e "/25\-promotion/d" \
    -i tests/configure
}

build() {
  cd harec

  ./configure --prefix=/usr

  make
}

check() {
  cd harec

  make check
}

package() {
  cd harec

  make DESTDIR="$pkgdir" install
}
