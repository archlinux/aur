# Maintainer: Stanislav Kovalenko <https://github.com/kovstas>
# Upstream author: Umputun <https://github.com/umputun>

pkgname=revdiff
pkgver=0.25.1
pkgrel=1
pkgdesc="TUI for reviewing diffs, files, and documents with inline annotations"
arch=('x86_64' 'aarch64')
url="https://github.com/umputun/revdiff"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/umputun/revdiff/archive/v$pkgver.tar.gz")
sha256sums=('ecd7c38fddeeb37d849ccb783701ed83e5b109d48d37ad0d6955d0c5271c129f')

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
