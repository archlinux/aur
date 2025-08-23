# Maintainer: Damian Höster <damian dot hoester at posteo dot de>

_pkgname=zflame
pkgname=$_pkgname-git
pkgver=c19.7fc5859
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
  cd $_pkgname
  echo c$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd $_pkgname
  zig build -Doptimize=ReleaseFast
}

package() {
  install -Dm755 $_pkgname/zig-out/bin/$_pkgname -t "$pkgdir/usr/bin"
  install -Dm644 $_pkgname/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
