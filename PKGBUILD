# Maintainer: Michael Placzek <mplaczek99@gmail.com>
pkgname=network-doctor
pkgver=1.1.0
pkgrel=1
pkgdesc="Terminal UI that diagnoses network connectivity and explains where the connection breaks"
arch=('x86_64' 'aarch64')
url="https://github.com/mplaczek99/network-doctor"
license=('Apache-2.0')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e8f78310e32532f7e3acb22e08c8b624d0c61f75658be7068903bb1456eaef2b')

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=0
  export GOFLAGS="-trimpath -mod=readonly -modcacherw"
  go build -ldflags "-s -w -X main.version=$pkgver" -o "$pkgname" .
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
