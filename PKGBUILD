# Maintainer: Liam Barrack <liam@liambarrack.com>
pkgname=leetui
pkgver=0.0.4
pkgrel=1
pkgdesc="A terminal UI for browsing and solving LeetCode problems"
arch=('x86_64' 'aarch64')
url="https://github.com/lbarto12/leetui"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b8501873d8808b7fe2f61530fdee4829aa5da2594512c0454594a0179257ec12')

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=0
  export GOFLAGS="-trimpath -mod=readonly -modcacherw"
  go build -ldflags="-s -w -X main.Version=v$pkgver" -o "$pkgname" .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
