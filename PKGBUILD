# Maintainer: Akira Fukushima <h3.poteto@gmail.com>
pkgname=rauncher-wayland
pkgver=0.1.2
pkgrel=1
pkgdesc="Application launcher for Linux Wayland desktop"
arch=("x86_64")
url="https://github.com/h3poteto/rauncher"
license=("GPL-3.0")
depends=("gtk4-layer-shell" "gtk4" "dbus" "hicolor-icon-theme")
makedepends=("rust" "make")
provides=("rauncher-wayland")
conflicts=("rauncher-x11")
source=("https://github.com/h3poteto/rauncher/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=("a522f18050fda4c8b4e8fb0cb2e1afb0")

prepare() {
  cd "rauncher-${pkgver}"
  rm .tool-versions
}

build() {
  cd "rauncher-${pkgver}"
  make build-wayland
}

package() {
  cd "rauncher-${pkgver}"
  install -Dm755 target/release/rauncher "$pkgdir/usr/bin/rauncher"
  install -Dm644 data/rauncher.desktop "$pkgdir/usr/share/applications/rauncher.desktop"
  install -Dm644 data/icons/hicolor/128x128/apps/rauncher.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/rauncher.png"
}
