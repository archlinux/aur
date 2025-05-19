# Maintainer: envolution
# Contributor: David Garfias <dgarfiasme at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=rutabaga-ffi
pkgver=0.1.6
pkgrel=1
pkgdesc="VGI cross-platform abstraction for GPU and display virtualization."
arch=("x86_64")
url="https://crosvm.dev/book/appendix/rutabaga_gfx.html"
license=(LicenseRef-chromiumos)
source=("git+https://chromium.googlesource.com/crosvm/crosvm#tag=v${pkgver}-rutabaga-release")
sha256sums=('285af77bfa34df753c8b88fd1139351e3efe0360a5531d8e26d0be9b7821f402')
makedepends=(
  rust
  meson
  git)
depends=(
  virglrenderer
  gfxstream)

build() {
  cd $srcdir/crosvm/rutabaga_gfx/ffi
  arch-meson . build -Dgfxstream=true
  meson compile -C build
}
package() {
  cd $srcdir/crosvm/rutabaga_gfx/ffi
  meson install -C build --destdir "$pkgdir"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
# vim:set ts=2 sw=2 et:
