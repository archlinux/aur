# Maintainer: Dmitry Mozzherin <dmozzherin@gmail.com>

pkgname=muro
pkgver=0.1.2
pkgrel=2
pkgdesc='Wallpaper with blurred or averaged background for X11'
arch=('x86_64')
url="https://codeberg.org/dimus/$pkgname"
license=('MIT')
makedepends=(
  'go'
  'make'
)
depends=(
  'feh'
  'xorg-xrandr'
)
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://codeberg.org/dimus/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('75fad5e4357e8c893060e8f89e5c79aefb4c48b9c8f2efe6a02ec69a831e943e')

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
  install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm755 "$srcdir/$pkgname/out/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
