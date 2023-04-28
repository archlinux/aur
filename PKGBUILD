# Maintainer: Dmitry Mozzherin <dmozzherin@gmail.com>

pkgname=madcow
pkgver=0.0.8
pkgrel=1
pkgdesc='ZFS snapshot manager command line tool'
arch=('x86_64')
url="https://codeberg.org/dimus/$pkgname"
license=('MIT')
makedepends=('go')
depends=(
  "pv"
)
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://codeberg.org/dimus/madcow/archive/v$pkgver.tar.gz")
sha256sums=('e038af16fd793e3921a1a2f710e3f4bbe3036d4cb6e49bef22822462dabc95d8')

prepare() {
  cd "$pkgname"
  mkdir -p build/
}

build() {
  cd "$pkgname"
  make buildrel
}

check() {
  cd "$pkgname"
  go test ./...
}

package() {
  cd "$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm755 ./$pkgname "$pkgdir/usr/bin/$pkgname"
}
