# Maintainer: Daniel Kuehn <daniel@kuehn.foo>
pkgname=wordgen
pkgver=0.5.3
pkgrel=1
pkgdesc='A CLI random word generator.'
arch=('x86_64')
url='https://github.com/wordgen/cli'
license=('AGPL-3.0-or-later')
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('e741e272f89a70e0ea514a920e598a831f58c73e5f97abfc4a3429db3e8c5a87')

check() {
  cd "$srcdir/cli-$pkgver"

  go test ./...
}

build() {
  cd "$srcdir/cli-$pkgver"

  CGO_ENABLED=0 \
    go build \
    -trimpath \
    -ldflags="-s -X main.version=v$pkgver" \
    -buildvcs=false \
    -o ./bin/wordgen \
    ./cmd/wordgen
}

package() {
  cd "$srcdir/cli-$pkgver"

  install -Dm755 ./bin/wordgen -t "$pkgdir/usr/bin/"
  install -Dm644 ./LICENSE -t "$pkgdir/usr/share/licenses/wordgen/"
}
