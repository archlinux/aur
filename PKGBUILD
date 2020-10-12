# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=zig-game-git
pkgver=v1.2.r0.gf1095b8
pkgrel=1
pkgdesc="It's a game where you shoot stuff"
arch=('x86_64')
url="https://github.com/bcampbell/zig"
license=('GPL3')
depends=('zlib' 'libpng' 'sdl2' 'sdl2_mixer' 'opengl-driver')
makedepends=('git' 'meson')
provides=('zig-game')
conflicts=('zig-game')
source=("git+https://github.com/bcampbell/zig")
sha256sums=('SKIP')

pkgver() {
  cd zig
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd zig
  arch-meson build
  ninja -C build
}

package() {
  cd zig
  DESTDIR="$pkgdir"/ ninja -C build install
}
