# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Chinmay Dalal <exu9qiu7p AT relay DOT firefox DOT com>
pkgname=lsr
pkgver=1.0.0
pkgrel=1
pkgdesc="ls but with io_uring"
arch=('x86_64')
url="https://tangled.sh/@rockorager.dev/lsr"
license=('MIT')
makedepends=('zig>=0.14.0')
source=("$pkgname::git+$url#tag=v${pkgver}")
md5sums=('06e83941f97dc95bf825dd67fc05948a')

prepare() {
  cd "$pkgname" || exit 1
  export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-global-cache/"
  zig build --fetch
}

build() {
  cd "$pkgname" || exit 1
  DESTDIR=build zig build \
                --summary all \
                --prefix "/usr" \
                --system "$srcdir/zig-global-cache/p" \
                -Doptimize=ReleaseFast
}

package() {
  cd "$pkgname" || exit 1
  cp -a build/* "$pkgdir/"
}

# vim:set ts=2 sw=2 et:
