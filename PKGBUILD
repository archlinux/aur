# shellcheck shell=bash disable=SC2034,SC2154,SC2164
# Maintainer: Chinmay Dalal <TILDE chinmay SLASH public-inbox AT lists.sr.ht>
pkgname=lsr
pkgver=1.0.0
pkgrel=2
pkgdesc="ls but with io_uring"
arch=('x86_64')
url="https://tangled.sh/@rockorager.dev/lsr"
license=('MIT')
makedepends=('zig0.14' 'git')
source=("$pkgname::git+$url#tag=v${pkgver}")
md5sums=('06e83941f97dc95bf825dd67fc05948a')

prepare() {
  cd "$pkgname"
  export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-global-cache/"
  zig build --fetch
}

build() {
  cd "$pkgname"
  DESTDIR=build zig build \
                --summary all \
                --prefix "/usr" \
                --system "$srcdir/zig-global-cache/p" \
                -Doptimize=ReleaseFast
}

package() {
  cd "$pkgname"
  cp -a build/* "$pkgdir/"
}

# vim:set ts=2 sw=2 et:
