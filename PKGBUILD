# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=ddns-updater
pkgver=2.2.0
pkgrel=1
pkgdesc="Lightweight scratch container updating DNS A records periodically for GoDaddy, Namecheap and DuckDNS"
arch=('x86_64')
url="https://github.com/qdm12/ddns-updater"
license=('MIT')
makedepends=('git' 'go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/qdm12/ddns-updater/archive/v$pkgver.tar.gz")

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  go mod download
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cd cmd/updater
  go build \
    -gcflags "all=-trimpath=${srcdir}" \
    -asmflags "all=-trimpath=${srcdir}" \
    -ldflags "-extldflags ${LDFLAGS}"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 cmd/updater/updater "$pkgdir/usr/bin/ddns-updater"
}

sha256sums=('9cd94b2a91e1a2c550806b4d0bf009cc49422ca3dbef8f460142ff03a7294d76')
