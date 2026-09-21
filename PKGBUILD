# Maintainer: Hong Shick Pak <hong@hspak.com>

pkgname=cosmurgy
pkgver=0.1.0
pkgrel=1
pkgdesc="Infrastructure mutator and state tracker"
arch=("x86_64")
url="https://github.com/hspak/cosmurgy"
license=("MIT")
depends=("ca-certificates")
makedepends=("go>=1.25.0")
options=("!debug")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("5c20af7a4a0d9b748927a46e8ab57623c3cfb54771469b38b08486c1f9f6224a")

build() {
  cd "$pkgname-$pkgver"
  CGO_ENABLED=0 go build -trimpath -buildvcs=false -mod=readonly -o cosmurgy ./cmd/cosmurgy
}

check() {
  cd "$pkgname-$pkgver"
  ./cosmurgy help >/dev/null
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 cosmurgy "$pkgdir/usr/bin/cosmurgy"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
