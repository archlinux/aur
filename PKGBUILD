# Maintainer: Damian Höster <damian dot hoester at posteo dot de>

_pkgname=zlint
pkgname=$_pkgname-git
pkgver=0.7.9.r10.1ebc4d2
pkgrel=1
pkgdesc='A linter for the Zig programming language'
arch=(x86_64)
url=https://github.com/DonIsaac/zlint
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
  git -C $_pkgname describe --long --tags | \
    sed -E 's/^v//; s/-([^-]*)-g([^-]*)$/-r\1.\2/; s/-/./g'
}

build() {
  cd $_pkgname
  zig build --release=safe
}

package() {
  install -Dm755 $_pkgname/zig-out/bin/$_pkgname -t "$pkgdir/usr/bin"
  install -Dm644 $_pkgname/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
