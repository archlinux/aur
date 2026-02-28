# Maintainer: aaddrick <aaddrick@users.noreply.github.com>
pkgname=selkie
pkgver=0.1.1
pkgrel=1
pkgdesc='Markdown viewer with GFM support and Mermaid chart rendering'
arch=('x86_64' 'aarch64')
url='https://github.com/aaddrick/selkie'
license=('MIT')
makedepends=(
  'zig>=0.14.1'
  'wayland'
  'wayland-protocols'
  'libx11'
  'libxcursor'
  'libxext'
  'libxfixes'
  'libxi'
  'libxinerama'
  'libxrandr'
  'libxrender'
  'libxkbcommon'
  'libglvnd'
  'mesa'
)
depends=(
  'libx11'
  'libxcursor'
  'libxext'
  'libxfixes'
  'libxi'
  'libxinerama'
  'libxrandr'
  'libxrender'
  'libxkbcommon'
  'libglvnd'
  'wayland'
  'glibc'
)
optdepends=('zenity: native file open dialog')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aaddrick/selkie/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c7e51caec06921e2ad2110b78d90f7ffaa220f5f7bde92fe1c659fe4de7f7107')

build() {
  cd "${pkgname}-${pkgver}"
  zig build -Doptimize=ReleaseSafe --prefix "$srcdir/staging/usr"
}

package() {
  cd "${pkgname}-${pkgver}"

  # Binary
  install -Dm755 "$srcdir/staging/usr/bin/selkie" "$pkgdir/usr/bin/selkie"

  # Application data
  cp -r "$srcdir/staging/usr/share" "$pkgdir/usr/share"

  # License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
