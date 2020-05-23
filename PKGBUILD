# Maintainer: Stephen Gregoratto <dev@sgregoratto.me>
pkgname=gmenu
pkgver=0.2.6
pkgrel=2
pkgdesc="desktop application launcher"
_url="https://gitlab.com/tslocum/gmenu"
url="${_url}.git"
license=('MIT')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
makedepends=('go')
depends=('gtk3')
source=("$pkgname-$pkgver.tar.gz::$_url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('901f3b6f60f1aa1ccf7af4ea06fa899f152d7805f6799f73d1280993072988db')

prepare(){
  cd "$pkgname-v$pkgver"
  mkdir -p build
}

build() {
  cd "$pkgname-v$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o build ./cmd/...
}

package() {
  install -Dm755 "$pkgname-v$pkgver/build/gmenu" "$pkgdir/usr/bin/gmenu"
  install -Dm755 "$pkgname-v$pkgver/build/gtkmenu" "$pkgdir/usr/bin/gtkmenu"
  install -Dm644 "$pkgname-v$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
