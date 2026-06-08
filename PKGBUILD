# Maintainer: Starlii10 <starliithestarbot@gmail.com>
pkgname=scratch-everywhere-git
pkgver=1.0.rc1.r0.g1f801da
pkgrel=1
pkgdesc="A custom Scratch runtime written in C++!"
conflicts=('scratch-everywhere')
provides=("scratch-everywhere=${pkgver})")
arch=('any')
url="https://github.com/ScratchEverywhere/ScratchEverywhere"
license=('LGPL-3.0-only')
depends=('curl' 'sdl2' 'sdl2_ttf' 'miniz' 'hicolor-icon-theme')
makedepends=('cmake' 'git')
source=('ScratchEverywhere::git+https://github.com/ScratchEverywhere/ScratchEverywhere')
sha256sums=('SKIP')

pkgver() {
  cd "ScratchEverywhere"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "ScratchEverywhere"
  cmake -B build
  cmake --build build
}
package() {
  cd "ScratchEverywhere"
  install -Dm755 build/scratch-pc $pkgdir/usr/bin/scratch-pc
  install -Dm644 gfx/linux/scratch-everywhere.desktop $pkgdir/usr/share/applications/scratch-everywhere.desktop
  install -Dm644 gfx/linux/scratch-everywhere.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/scratch-everywhere.svg
}
