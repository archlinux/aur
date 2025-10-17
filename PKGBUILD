# Maintainer: Rodrigo Martins rodm.martins@proton.me
pkgname=hypr-local-workspaces
pkgver=0.3.1
pkgrel=1
pkgdesc="Make Hyprland workspaces local per monitor (Go)"
arch=('x86_64' 'aarch64')
url="https://github.com/xKirtle/hypr-local-workspaces"
license=('MIT')
depends=('glibc')
makedepends=('go')
options=('!debug' '!strip')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9d768c45bfa1b78d0cc24f42359b85a1199338ba68b5bebc276f4faddc60918b')

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
