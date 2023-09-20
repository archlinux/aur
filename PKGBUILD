# Maintainer: Gabriel M. Dutra <nulldutra@proton.me>

pkgname=opentofu-git
pkgver=r31726.90f7e52
pkgrel=1
pkgdesc="OSS tool for building, changing, and versioning infrastructure safely and efficiently."
url='https://github.com/opentofu/opentofu'
arch=('x86_64')
license=('MPL2')
makedepends=('git' 'go')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd opentofu
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd opentofu
  CGO_ENABLED=0 go build -ldflags "-w -s" -o bin/ .
}

package() {
  cd opentofu
  install -Dm755 bin/opentofu "$pkgdir/usr/bin/opentofu"
}

