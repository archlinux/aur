# Maintainer: Keiran <keiran@keircn.com>
pkgname=karu
pkgver=0.2.0
pkgrel=1
pkgdesc="A command-line tool for downloading and watching anime"
arch=('x86_64')
url="https://github.com/keircn/karu"
license=('MIT')
depends=()
makedepends=('go')
source=("$pkgname-$pkgver::git+https://github.com/keircn/karu.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=0
  go build -trimpath -ldflags="-s -w" -o karu ./cmd/karu
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 karu "$pkgdir/usr/bin/karu"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
