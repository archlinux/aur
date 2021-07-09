# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=ddns-updater
pkgver=2.4.0
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

sha256sums=('25677e8950538aa12975b7480c7bff2c018c15184da17147d09b875c1e03041f')
