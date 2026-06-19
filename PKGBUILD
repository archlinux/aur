# Maintainer: Stanislav Kovalenko <https://github.com/kovstas>
# Upstream author: Umputun <https://github.com/umputun>

pkgname=revdiff
pkgver=1.7.1
pkgrel=1
pkgdesc="TUI for reviewing diffs, files, and documents with inline annotations"
arch=('x86_64' 'aarch64')
url="https://github.com/umputun/revdiff"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/umputun/revdiff/archive/v$pkgver.tar.gz")
sha256sums=('e0a0c621e987bebc4d4f7f72bcd0e41c79e812362c5014dd6b3ec26b0ee40318')

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=0
  export GOFLAGS="-mod=vendor -trimpath -modcacherw"
  local _revision="v${pkgver}-aur"
  go build \
    -ldflags "-s -w -X main.revision=${_revision}" \
    -o revdiff ./app
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 revdiff "$pkgdir/usr/bin/revdiff"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
