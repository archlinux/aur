# maintainer: krishnassh <krishna.pytech@gmail.com>
pkgname=gophertube
pkgver=2.8.1
pkgrel=1
pkgdesc="minimal terminal youtube client"
arch=('x86_64' 'aarch64')
url="https://github.com/KrishnaSSH/GopherTube"
license=('GPL3')
depends=('mpv' 'yt-dlp')
makedepends=('go' 'git')
source=("gophertube-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/gophertube-$pkgver"
  export CGO_ENABLED=0
  export GO111MODULE=on
  go mod download
  go build \
    -trimpath \
    -ldflags "-s -w -X gophertube/internal/app.version=$pkgver" \
    -o gophertube .
}

package() {
  cd "$srcdir/gophertube-$pkgver"
  install -Dm755 gophertube "$pkgdir/usr/bin/gophertube"
}
