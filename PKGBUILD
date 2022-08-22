# Maintainer: madprops <mprops at protonmail dot com>

pkgname="rumsfeld-git"
pkgdesc="Search file paths recursively. Written in Nim."
pkgver=r1.1eafb9e
pkgrel=1
arch=("x86_64")
url="https://github.com/madprops/rumsfeld"
license=("GPL3")
makedepends=("nim" "nimble" "git")
sha256sums=("SKIP")
source=("$pkgname::git+https://github.com/madprops/rumsfeld.git")

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd rumsfeld-git
  nimble install -d -y
  nim compile -d:release -o=bin/rumsfeld-release-linux "src/rumsfeld.nim"
}

package() {
  cd rumsfeld-git
  install -D -m755 bin/rumsfeld-release-linux "$pkgdir/usr/bin/rumsfeld"
}
