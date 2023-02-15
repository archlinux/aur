# Maintainer: Dmitry Mozzherin <dmozzherin@gmail.com>

pkgname=madcow
pkgver=0.0.6.1
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
sha256sums=('3c757ebb311c442636400b4fd3393cd525c7c4df729f37ae947aa67a2132bf7b')

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
  install -Dm755 ./out/bin/$pkgname "$pkgdir/usr/bin/$pkgname"
}
