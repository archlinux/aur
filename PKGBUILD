# Maintainer: Damian Höster <damian.hoester@posteo.de>

_pkgname=zflame
pkgname=$_pkgname-git
pkgver=0.r29.4bb890d
pkgrel=1
pkgdesc='🔥 Flamegraph Profiling'
arch=(x86_64)
url=https://github.com/hendriknielaender/zflame
license=(MIT)
makedepends=(
  git
  zig
)
provides=($_pkgname)
conflicts=($_pkgname)
source=($_pkgname::git+$url.git)
sha256sums=(SKIP)

pkgver() {
  printf "0.r%s.%s" \
    "$(git -C $_pkgname rev-list --count HEAD)" \
    "$(git -C $_pkgname rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  zig build -Doptimize=ReleaseFast
}

package() {
  install -Dm755 $_pkgname/zig-out/bin/$_pkgname -t "$pkgdir/usr/bin"
  install -Dm644 $_pkgname/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
