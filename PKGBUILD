pkgname=openblack-git
pkgver=r346.f2d6b12
pkgrel=1
pkgdesc="Open source reimplementation of the game Black & White (2001)."
arch=('x86_64')
url="https://github.com/openblack/openblack"
license=('GPL3' 'MIT')

depends=('fmt' 'spdlog' 'entt' 'glew' 'sdl2' 'glm')
makedepends=('git' 'cmake')
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
        -DUSE_SUBMODULES=OFF \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo
  make
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
