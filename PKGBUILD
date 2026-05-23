# Maintainer: lemachinarbo <your@email.com>
pkgname=ddev-clim
pkgver=0.2.0
pkgrel=1
pkgdesc="Advanced Terminal UI for managing DDEV instances"
arch=('x86_64' 'aarch64')
url="https://github.com/lemachinarbo/ddev-clim"
license=('MIT')
depends=('ddev' 'glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgname-v$pkgver.tar.gz")

build() {
  cd "$pkgname-v$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  
  go build -o "$pkgname" main.go
}

package() {
  cd "$pkgname-v$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 ddev-clim.service "$pkgdir/usr/lib/systemd/user/ddev-clim.service"
}
sha256sums=('8309aa4d0ff5fb0bb3bb6fc6593c9bc1a8cbc33678d2c0d0ac095ad6aabba1a8')
