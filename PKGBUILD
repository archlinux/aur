# Maintainer: Dmitry Mozzherin <dmozzherin@gmail.com>

pkgname=madcow
pkgver=0.0.5
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
sha256sums=('5c41ba6da560927c66c5184bbb7b012f11afb796eb99ac502ddec1cc2a307b5b')

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
