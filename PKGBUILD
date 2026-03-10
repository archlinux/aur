# Maintainer: Max Harris <maxh213@users.noreply.github.com>
pkgname=sbars
pkgver=0.2.0
pkgrel=1
pkgdesc="A Sims-style needs tracker TUI for your terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/maxh213/sbars"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/maxh213/sbars/archive/v$pkgver.tar.gz")
sha256sums=('ebd1ca612481489896a3299300e84627669122af96a06fc659e5ee9b3723396b')

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
