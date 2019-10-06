# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=rtop-git
pkgver=1.0+5.gc49441bc1f
pkgrel=1
pkgdesc="Interactive, remote system monitoring tool based on SSH"
url=http://rtop-monitor.org
license=(MIT)
arch=(x86_64)
source=('git+https://github.com/rapidloop/rtop')
sha256sums=('SKIP')
makedepends=("go")

pkgver() {
  git -C rtop describe --abbrev=10 |
    sed 's/^release_//; s/-/+/; s/-/./'
}

build() {
  export GOPATH="$srcdir"
  export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"
  go get github.com/rapidloop/rtop
}

package() {
  install -Dm755 bin/rtop "$pkgdir"/usr/bin/rtop
}
