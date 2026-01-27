# Maintainer: Onxy <onxy@example.com>
pkgname=betterwallpaper-git
pkgver=r4.5e1762d
pkgrel=1
pkgdesc="A modern, high-performance animated wallpaper manager for Linux (WIP)"
arch=('x86_64')
url="https://github.com/Misiix9/BetterWallpaper"
license=('GPL3')
depends=('gtk4' 'libadwaita' 'gtk4-layer-shell' 'mpv' 'curl' 'glew' 'nlohmann-json' 'wayland')
optdepends=('linux-wallpaperengine: for Wallpaper Engine support')
makedepends=('git' 'cmake' 'base-devel')
source=("git+https://github.com/Misiix9/BetterWallpaper.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/BetterWallpaper"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/BetterWallpaper"
  cmake -B build -S . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd "$srcdir/BetterWallpaper"
  DESTDIR="$pkgdir" cmake --install build
}
