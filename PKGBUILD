# Maintainer: Fabrice Aneche <akh@inair.space>

pkgname=wpail
pkgver=0.1
pkgrel=1
pkgdesc="Show what port or application is listening, with developer build metadata"
arch=('x86_64' 'aarch64')
url="https://github.com/akhenakh/wpail"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/akhenakh/wpail/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fdc6356b0f146bb8711d23b0c5a0253467c2fcfc005314671688245b93016535')

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
