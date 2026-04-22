# Maintainer: Stanislav Kovalenko <https://github.com/kovstas>
# Upstream author: Umputun <https://github.com/umputun>

pkgname=revdiff
pkgver=0.22.0
pkgrel=1
pkgdesc="TUI for reviewing diffs, files, and documents with inline annotations"
arch=('x86_64' 'aarch64')
url="https://github.com/umputun/revdiff"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/umputun/revdiff/archive/v$pkgver.tar.gz")
sha256sums=('bbc5222e3a734d860d9c46a3788edc2cc15e867d278a1b25021924d7a7b81af6')

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
