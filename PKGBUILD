# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=gpuvis-git
pkgver=r1649.e2c58f6
pkgrel=1
pkgdesc=""
arch=(x86_64)
url="https://github.com/mikesart/gpuvis"
license=('MIT')
depends=('cmake')
source=("git+$url")
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir"/gpuvis
  printf "r%d.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"/gpuvis
  mkdir -p build
  cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    ..
  make
}

package() {
  cd "$srcdir"/gpuvis
  install -dm755 "$pkgdir/usr/bin/"
  install -m755 build/gpuvis "$pkgdir/usr/bin/"
}
