# Maintainer: Fabrice Aneche <akh@inair.space>

pkgname=ou
pkgver=0.1.5
pkgrel=1
pkgdesc="Open an interactive map in your terminal and display a location or geometry"
arch=('x86_64' 'aarch64')
url="https://github.com/akhenakh/ou"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/akhenakh/ou/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fe38e3291595f42a706c6bb13bd9c52768a8bb72229731711725e8e0b3f33f7e')

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=0
  go build -trimpath -buildvcs=false -ldflags "-s -w" -o ou .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 ou "$pkgdir/usr/bin/ou"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
