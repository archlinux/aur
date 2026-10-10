# Maintainer: bromigOS <packages@bromigos.org>
# Contributor: blackflame
pkgname=mehshell
pkgver=0.2.3
pkgrel=1
pkgdesc='Fast parallel zsh prompt engine for bromigOS'
arch=('x86_64' 'aarch64')
url='https://github.com/bromigos-org/mehshell'
license=('MIT')
depends=('zsh')
makedepends=('go')
conflicts=('mehshell-bin')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ea22a478be7b8b07e542475aff8fb7cf63dd16ed31bf15498a4439512369b0d4')
build() {
  cd "$pkgname-$pkgver"
  CGO_ENABLED=0 go build -trimpath -ldflags="-s -w -X main.Version=$pkgver" -o mehshell .
}
check() {
  cd "$pkgname-$pkgver"
  go vet ./...
  go test ./...
}
package() {
  cd "$pkgname-$pkgver"
  install -Dm755 mehshell "$pkgdir/usr/bin/mehshell"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
