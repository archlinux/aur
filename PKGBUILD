# Maintainer: madprops <mprops at protonmail dot com>

pkgname="lq-git"
pkgdesc="File listing tool. Written in Nim."
pkgver=r284.28f9a69
pkgrel=1
arch=("x86_64")
url="https://github.com/madprops/lq"
license=("GPL2")
makedepends=("nim" "nimble" "git")
sha256sums=("SKIP")
source=("$pkgname::git+https://github.com/madprops/lq.git")

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd lq-git
  nimble install -d -y
  nim compile -d:release -o=bin/lq-release-linux "src/lq.nim"
}

package() {
  cd lq-git
  install -D -m755 bin/lq-release-linux "$pkgdir/usr/bin/lq"
}
