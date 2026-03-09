# Maintainer: Max Harris <maxh213@users.noreply.github.com>
pkgname=sbars
pkgver=0.1.2
pkgrel=1
pkgdesc="A Sims-style needs tracker TUI for your terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/maxh213/sbars"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/maxh213/sbars/archive/v$pkgver.tar.gz")
sha256sums=('fc6e8eb0b1bb5a783e3fecd401c0f4e829076d04f5acdd65cd63fe7bb0e65233')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "$pkgname" .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
