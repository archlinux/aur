# Maintainer: madprops <mprops at protonmail dot com>

pkgname="goldie-git"
pkgdesc="Search content of text files recursively. Written in Nim."
pkgver=r32.cf9b2dc
pkgrel=1
arch=("x86_64")
url="https://github.com/madprops/goldie"
license=("GPL3")
makedepends=("nim" "nimble" "git")
sha256sums=("SKIP")
source=("$pkgname::git+https://github.com/madprops/goldie.git")

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd goldie-git
  nimble install -d -y
  nim compile -d:release -o=bin/goldie-release-linux "src/goldie.nim"
}

package() {
  cd goldie-git
  install -D -m755 bin/goldie-release-linux "$pkgdir/usr/bin/goldie"
}
