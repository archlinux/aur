# Maintainer: Fabrice Aneche <akh@inair.space>

pkgname=wpail
pkgver=0.4
pkgrel=1
pkgdesc="Show what port or application is listening, with developer build metadata"
arch=('x86_64' 'aarch64')
url="https://github.com/akhenakh/wpail"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/akhenakh/wpail/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1e1f11e369bf982c3548e680ed9f930acc6b730242a0d74073b29183492e7750')

build() {
  cd "$pkgname-$pkgver"
  # Linux reads procfs and needs no cgo.
  export CGO_ENABLED=0
  go build -trimpath -buildvcs=false -ldflags "-s -w" -o wpail .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 wpail "$pkgdir/usr/bin/wpail"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
