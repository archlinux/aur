# Maintainer: Damian Höster <damian.hoester@posteo.de>

_pkgname=fcvvdp
pkgname=$_pkgname-git
pkgver=0.3.3.r2.40767a7
pkgrel=1
pkgdesc='A fast C implementation of the CVVDP metric'
arch=(
  x86_64
  aarch64
)
url=https://github.com/halidecx/fcvvdp
license=(Apache-2.0)
makedepends=(
  git
  zig
)
provides=($_pkgname)
conflicts=($_pkgname)
options=(staticlibs)
source=($_pkgname::git+$url.git)
sha256sums=(SKIP)

pkgver() {
  git -C $_pkgname describe --long --tags |
    sed -E 's/^v//; s/-([^-]*)-g([^-]*)$/.r\1.\2/; s/-/./g'
}

build() {
  cd $_pkgname
  zig build --release=fast
}

package() {
  install -Dm755 $_pkgname/zig-out/bin/$_pkgname -t "$pkgdir"/usr/bin
  install -Dm644 $_pkgname/zig-out/include/cvvdp.h -t "$pkgdir"/usr/include
  install -Dm644 $_pkgname/zig-out/lib/libcvvdp.a -t "$pkgdir"/usr/lib
  install -Dm644 $_pkgname/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  install -Dm644 $_pkgname/README.md -t "$pkgdir"/usr/share/doc/$pkgname
}
