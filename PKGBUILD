# Maintainer: Bobby Burden III <bobby@brb3.org>
pkgname=torsniff
pkgver=0.0.6
pkgrel=1
pkgdesc="A sniffer for fetching torrents from the BitTorrent network"
arch=("x86_64")
url="https://github.com/fanpei91/torsniff"
license=("MIT")
depends=("glibc")
makedepends=("go")
provides=("torsniff")
source=(
"${pkgname}-${pkgver}.tar.gz::https://github.com/fanpei91/torsniff/archive/v${pkgver}.tar.gz"
)
sha256sums=("d6d26c89add787140e8dce23f3326cb9538d2e50158d9a64b694c991d5f3cf89")

build() {
  cd "$pkgname-$pkgver"

  # Dependencies
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
