# Maintainer: DexterHaxxor <fox@dexterhaxxor.dev>
# Contributor: Jelle van der Waa <jelle@archlinux.org>

pkgname=sdl2-compat-git
pkgver=r701.44a2d4d
pkgrel=1
pkgdesc="SDL2 runtime compatibility library using SDL3"
url="https://github.com/libsdl-org/sdl2-compat"
depends=('sdl3' 'bash' 'glibc')
makedepends=('cmake' 'libgl' 'ninja' 'git')
arch=('x86_64')
conflicts=('sdl2')
provides=('sdl2')
license=('MIT')
source=("git+https://github.com/libsdl-org/sdl2-compat.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/sdl2-compat"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"

  cmake -B build -S sdl2-compat \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_BUILD_TYPE=None \
  -GNinja

  cmake --build build
}

package() {
  cd "$srcdir"

  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 "${srcdir}/sdl2-compat/LICENSE.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

