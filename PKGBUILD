# Maintainer: Dmitry Mozzherin <dmozzherin@gmail.com>

pkgname=madcow
pkgver=0.0.10
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
sha256sums=('50853c8c55671aec661b67c934ba2f998139e6d4f74ed4e6335e4c98a169367c')

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
