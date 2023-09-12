# Maintainer: Gabriel M. Dutra <nulldutra@proton.me>

pkgname=opentf-git
pkgver=r31685.8df7217
pkgrel=1
pkgdesc="OSS tool for building, changing, and versioning infrastructure safely and efficiently."
url='https://github.com/opentffoundation/opentf'
arch=('x86_64')
license=('MPL2')
makedepends=('git')
source=("git+https://github.com/opentffoundation/opentf.git")
sha256sums=('SKIP')

pkgver() {
  cd opentf
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd opentf
  CGO_ENABLED=0 go build -ldflags "-w -s" -o bin/ .
}

package() {
  cd opentf
  install -Dm755 bin/opentf "$pkgdir/usr/bin/opentf"
}

