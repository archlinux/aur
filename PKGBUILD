# Maintainer: visorcraft <thomas@visorcraft.com>

pkgname=zigit
pkgver=0.1.0
pkgrel=1
pkgdesc='Fast screenshots, clipboard handoff, and annotation for Wayland'
arch=('x86_64' 'aarch64')
url='https://github.com/visorcraft/ZigIt'
license=('GPL-3.0-only')
depends=(
  'glfw'
  'libglvnd'
  'wayland'
  'wl-clipboard'
)
makedepends=(
  'libxkbcommon'
  'mesa'
  'zig0.13'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/visorcraft/ZigIt/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e842f2d904f6cf8966d79bee89eb030a43f277c9286c2cae4af43434246ed460')

build() {
  cd "ZigIt-$pkgver"
  zig0.13 build -Doptimize=ReleaseSafe \
    --cache-dir "$srcdir/zig-cache" \
    --global-cache-dir "$srcdir/zig-global-cache"
}

package() {
  cd "ZigIt-$pkgver"
  install -Dm755 zig-out/bin/zigit "$pkgdir/usr/bin/zigit"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
