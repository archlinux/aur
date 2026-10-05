# Maintainer: Avahe Kellenberger <avahe at protonmail dot ch>
# SPDX-License-Identifier: 0BSD

pkgname=melatonina
pkgver=0.1.0
pkgrel=1
pkgdesc='Simple blue light filter for Wayland compositors supporting wlr-gamma-control'
arch=('x86_64')
url='https://github.com/SoulThy/melatonina'
# Upstream v0.1.0 declares no license.
# The adjacent 0BSD LICENSE covers only these packaging files.
license=('LicenseRef-unknown')
# zig-git currently provides zig=0.17.0; the repository's Zig 0.16 is too old.
makedepends=('zig>=0.17.0' 'zig<0.18')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e77492b8db969e974c81e7d40d5d648d31a5b238d219e143ebd3228a20740d8e')

build() {
  cd "$pkgname-$pkgver"

  export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-global-cache"
  zig build \
    -Doptimize=safe \
    -Dcpu=baseline \
    --prefix "$srcdir/build" \
    --cache-dir "$srcdir/zig-cache"
}

package() {
  install -Dm755 "$srcdir/build/bin/melatonina" "$pkgdir/usr/bin/melatonina"
}
