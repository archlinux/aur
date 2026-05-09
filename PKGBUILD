# Maintainer: Thomas Butler <goliyth@gmail.com>
pkgname=hyprmural
pkgver=1.1.0
pkgrel=1
pkgdesc="Per-workspace wallpaper tool for Hyprland (multi-output, layer-shell, GLES2)"
arch=('x86_64' 'aarch64')
url="https://github.com/fnrhombus/hyprmural"
license=('BSD-3-Clause')
depends=(
  'wayland'
  'mesa'
  'libxkbcommon'
  'libwebp'
  'hyprland'
)
makedepends=(
  'cmake'
  'ninja'
  'wayland-protocols'
  'pkgconf'
)
optdepends=(
  'python: bundled examples/accent/ hook scripts'
  'python-pillow: required by examples/accent/{accent,pill-accents}.py'
  'matugen: full-theme M3 palette pipeline used alongside per-workspace accents'
  'imagemagick: convenience for generating test wallpapers'
)
source=("hyprmural-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0c658de4e4b7cce99f329caa14eb9a99bb4c7b3ec0879b1a8ca977757daa4144')

build() {
  cd "${srcdir}/hyprmural-${pkgver}"
  cmake -S . -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd "${srcdir}/hyprmural-${pkgver}"
  DESTDIR="${pkgdir}" cmake --install build
}
