# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=glfw2to3-git
pkgver=2.7.10
pkgrel=1
pkgdesc="Porting library to make GLFW 2.x games run on top of GLFW 3.x"
arch=('x86_64')
url="https://www.glfw.org/"
license=('ZLIB')
depends=('glfw')
makedepends=('git' 'meson')
provides=('glfw2to3' 'glfw2=2.7.10')
conflicts=('glfw2to3' 'glfw2')
source=("git+https://github.com/linkmauve/glfw2to3")
sha256sums=('SKIP')

prepare() {
  cd glfw2to3
}

build() {
  cd glfw2to3
  arch-meson build
  ninja -C build
}

package() {
  cd glfw2to3
  DESTDIR="$pkgdir"/ ninja -C build install

  # This would conflict with glfw3.
  rm "$pkgdir"/usr/lib/libglfw.so
}
