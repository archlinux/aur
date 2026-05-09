# Maintainer: Thomas Butler <goliyth@gmail.com>
pkgname=hyprmural-git
pkgver=r20.dc03e3f
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
  'git'
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
provides=('hyprmural')
conflicts=('hyprmural')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/hyprmural"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/hyprmural"
  cmake -S . -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd "${srcdir}/hyprmural"
  DESTDIR="${pkgdir}" cmake --install build
}
