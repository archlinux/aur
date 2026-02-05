# Maintainer: Alan <alan.ari.krd@gmail.com>

pkgname="imgfetch"
pkgver=r32.904f81c
pkgrel=1
pkgdesc="Display pixel-perfect images in your terminal using Kitty's graphics protocol."
arch=('x86_64' 'aarch64')
url="https://github.com/alan-ar1/$pkgname"
license=('MIT')
makedepends=('git' 'go')
conflicts=("$pkgname")
options=('!lto')
source=("git+$url")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"
  mkdir -p build/
}

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$pkgname"
  go build -o build ./cmd/imgfetch
}

package() {
  cd "$pkgname"
  install -Dm755 "build/$pkgname" -t "$pkgdir/usr/bin/"
}
