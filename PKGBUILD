pkgname=letterboxd-tui
pkgver=0.0.2
pkgrel=1
pkgdesc="Letterboxd in your terminal"
arch=('x86_64' 'aarch64')
url='https://github.com/solean/letterboxd-tui'
license=('unknown')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/solean/letterboxd-tui/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0018e3812da13cfa69971b64041451b1c7a25da9ad02a1c101434b54e896fb4f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export CGO_ENABLED=0
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  go build -ldflags "-s -w -X github.com/solean/letterboxd-tui/internal/version.Version=$pkgver" -o letterboxd ./cmd/letterboxd
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 letterboxd "$pkgdir/usr/bin/letterboxd"
}
