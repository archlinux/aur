# Maintainer: envolution
# Contributor: David Garfias <dgarfiasme at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=rutabaga-ffi
pkgver=0.1.3
pkgrel=2
pkgdesc="The Rutabaga Virtual Graphics Interface (VGI) is a cross-platform abstraction for GPU and display virtualization."
arch=("x86_64")
url="https://crosvm.dev/book/appendix/rutabaga_gfx.html"
license=(LicenseRef-chromiumos)
source=("git+https://chromium.googlesource.com/crosvm/crosvm#tag=v${pkgver}-rutabaga-release")
sha256sums=('af5530e0ffffb879a539f5d10b8e6f25f0e81e7cffb6dc2bb55b51c264885d66')
makedepends=(
  rust
  git)
depends=(
  virglrenderer
  gfxstream)

build() {
  cd $srcdir/crosvm/rutabaga_gfx/ffi
  RUSTFLAGS='-Clink-arg=-L='/usr/lib/ make
}
package() {
  cd $srcdir/crosvm/rutabaga_gfx/ffi
  make prefix="$pkgdir/usr/" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 README.* -t "$pkgdir"/usr/share/doc/$pkgname
}
# vim:set ts=2 sw=2 et:
