# Maintainer: Luís Ferreira <contact@lsferreira.net>

pkgname=vulkan-headers-git
pkgver=r232.c51545d3
pkgrel=1
pkgdesc="Vulkan header files"
groups=('vulkan-devel')
arch=('any')
url="https://github.com/KhronosGroup/Vulkan-Headers"
provides=('vulkan-headers' 'vulkan-hpp')
license=('Apache')
conflicts=('vulkan-headers')
source=("git+https://github.com/KhronosGroup/Vulkan-Headers.git")
sha512sums=('SKIP')
makedepends=(cmake git)
pkgver() {
  cd "$srcdir/Vulkan-Headers"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/Vulkan-Headers"

  rm -rf build ; mkdir build ; cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    ..
  make
}

package() {
  cd "$srcdir/Vulkan-Headers/build"

  make DESTDIR="${pkgdir}" install
}
