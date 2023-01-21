# Maintainer: Dmitry Mozzherin <dmozzherin@gmail.com>

pkgname=muro
pkgver=0.1.0
pkgrel=1
pkgdesc='Wallpaper for X11/Wayland'
arch=('x86_64')
url="https://codeberg.org/dimus/$pkgname"
license=('MIT')
makedepends=('go')
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://codeberg.org/dimus/muro/archive/v0.1.0.tar.gz")
sha256sums=('f6f1cf98820df751f9f5fc0c41a1533dbca8f9cf1bbeae85e1725b92126d403a')

prepare() {
  cd "$pkgname"
  mkdir -p build/
}

build() {
  cd "$pkgname"
  make build
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
