# hostess-git
# An idempotent command-line utility for managing your /etc/hosts file.
# Maintainer: Dian Fay <dian.m.fay@gmail.com>
pkgname=hostess-git
pkgver=v0.3.0.r0.4f98a9f
pkgrel=1
pkgdesc="An idempotent command-line utility for managing your /etc/hosts file (git)."
arch=("x86_64")
url="https://github.com/cbednarski/hostess"
license=("MIT")
md5sums=('SKIP')
makedepends=("git" "go")
source=("git+https://github.com/cbednarski/hostess")

pkgver(){
  cd "$srcdir/hostess"

  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  export GOPATH="$srcdir"
  export PATH="$PATH:$srcdir/src/bin/"

  mkdir -p "$srcdir/src/github.com/cbednarski"

  ln -s "$srcdir/hostess" "$srcdir/src/github.com/cbednarski"
}

build() {
  cd "$srcdir/src/github.com/cbednarski/hostess"

  PATH="$PATH:$srcdir/bin/" make
}

package() {
  install -Dm755 "$srcdir/hostess/hostess" "$pkgdir/usr/bin/hostess"
}
