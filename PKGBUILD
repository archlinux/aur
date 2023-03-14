# Maintainer: Dmitry Mozzherin <dmozzherin@gmail.com>

pkgname=madcow
pkgver=0.0.7
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
sha256sums=('b199848678d2986911bf91fd76b35410068ce415e6a525064e0fbfdb91632c49')

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
