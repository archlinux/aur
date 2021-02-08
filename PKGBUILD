pkgname=openblack-git
pkgver=r1039.51cb468
pkgrel=2
pkgdesc="Open source reimplementation of the game Black & White (2001)."
arch=('x86_64')
url="https://github.com/openblack/openblack"
license=('GPL3' 'MIT')

depends=('fmt' 'spdlog' 'entt' 'sdl2' 'glm' 'bgfx')
makedepends=('git' 'cmake' 'bgfx-cmake-git' 'cxxopts')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")

source=('git://github.com/openblack/openblack.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo
  cmake --build .
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  cmake --install . -v --strip --prefix "$pkgdir/usr"
}

# vim:set ts=2 sw=2 et:
