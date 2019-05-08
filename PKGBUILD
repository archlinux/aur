# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=gpuvis-git
pkgver=r1641.c927324c1296b5f50819
pkgrel=1
pkgdesc=""
arch=(x86_64)
url="https://github.com/mikesart/gpuvis"
license=('MIT')
source=("git+$url"
        'fix.diff')
sha1sums=('SKIP'
          '0011dcd305d7cb9d67d36d5329240e4d06a68484')

pkgver() {
  cd "$srcdir"/gpuvis
  printf "r%d.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir"/gpuvis
  patch -sp1 -i "$srcdir"/fix.diff
}

build() {
  cd "$srcdir"/gpuvis
  mkdir build
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
