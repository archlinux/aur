# Maintainer: Bobby Burden III <bobby@brb3.org>
pkgname=torsniff
pkgver=0.0.9
pkgrel=1
pkgdesc="A sniffer for fetching torrents from the BitTorrent network"
arch=("x86_64")
url="https://github.com/fanpei91/torsniff"
license=("MIT")
depends=("glibc")
makedepends=("go" "git")
provides=("torsniff")
source=(
"${pkgname}-${pkgver}.tar.gz::https://github.com/fanpei91/torsniff/archive/v${pkgver}.tar.gz"
)
sha256sums=("cd9169604b62f8128a5b12cdfd506c05626802952db4dabbd2917e929c65f8ab")

build() {
  cd "$pkgname-$pkgver"

  # Go Dependencies
  go get go.etcd.io/etcd/pkg/fileutil
  go get github.com/mitchellh/go-homedir
  go get github.com/marksamman/bencode
  go get github.com/spf13/cobra
  go get golang.org/x/time/rate
  go get github.com/inconshreveable/mousetrap
  go get runtime/cgo

  # Setup Go
  export PATH=/usr/lib/go/bin:$PATH

  # Build
  GOARCH=amd64 GOOS=linux go build -o releases/torsniff
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "releases/torsniff" "${pkgdir}/usr/bin/torsniff"
}
