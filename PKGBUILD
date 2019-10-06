# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=rtop
pkgver=1.0
pkgrel=1
pkgdesc="Interactive, remote system monitoring tool based on SSH"
url=http://rtop-monitor.org
license=(MIT)
arch=(x86_64)
source=("https://github.com/rapidloop/rtop/archive/release_${pkgver}.tar.gz")
sha256sums=('44ab02299a204befe49d725bdb76a249db419807e13b7ca451ba14ea5d3de1c2')
makedepends=("go")

build() {
  export GOPATH="$srcdir"
  cd rtop-release_$pkgver
  export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"
  go get golang.org/x/crypto/ssh
  go get golang.org/x/crypto/ssh/agent
  go get golang.org/x/crypto/ssh/terminal
  go build -o rtop
}

package() {
  cd rtop-release_$pkgver
  install -Dm755 rtop "$pkgdir"/usr/bin/rtop
}
