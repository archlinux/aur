# Maintainer: Rodrigo Martins rodm.martins@proton.me
pkgname=hypr-local-workspaces
pkgver=0.4.0
pkgrel=1
pkgdesc="Make Hyprland workspaces local per monitor (Go)"
arch=('x86_64' 'aarch64')
url="https://github.com/xKirtle/hypr-local-workspaces"
license=('MIT')
depends=('glibc')
makedepends=('go')
options=('!debug' '!strip')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4cf9799c309f15573169aa848816efdc0d82630f12f1859e95edeba67f468b5c')

build() {
  cd "$srcdir/hypr-local-workspaces-$pkgver"
  export CGO_ENABLED=0
  go build -trimpath -ldflags "-s -w -X main.version=$pkgver" \
    -o hypr-local-workspaces ./cmd/hypr-local-workspaces
}

package() {
  cd "$srcdir/hypr-local-workspaces-$pkgver"
  install -Dm755 "hypr-local-workspaces" "$pkgdir/usr/bin/hypr-local-workspaces"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
