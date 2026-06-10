# Maintainer: Akira Fukushima <h3.poteto@gmail.com>
pkgname=rauncher-x11
pkgver=0.3.1
pkgrel=1
pkgdesc="Application launcher for Linux X11 desktop"
arch=("x86_64")
url="https://github.com/h3poteto/rauncher"
license=("GPL-3.0")
depends=("gtk4" "libx11" "libxcb" "libxkbcommon" "dbus" "snixembed" "hicolor-icon-theme")
makedepends=("rust" "make")
provides=("rauncher-x11")
conflicts=("rauncher-wayland")
source=("https://github.com/h3poteto/rauncher/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=("b32f88f2a28f5328909d304a0d68e0fd")

prepare() {
  cd "rauncher-${pkgver}"
  rm .tool-versions
}

build() {
  cd "rauncher-${pkgver}"
  make build-x11
}

package() {
  cd "rauncher-${pkgver}"
  install -Dm755 target/release/rauncher "$pkgdir/usr/bin/rauncher"
  install -Dm644 data/rauncher.desktop "$pkgdir/usr/share/applications/rauncher.desktop"
  install -Dm644 data/icons/hicolor/128x128/apps/rauncher.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/rauncher.png"
}
