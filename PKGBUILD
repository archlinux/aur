# Maintainer: Alexey Andreyev <aa13q@ya.ru>

_gitprojectname=qtrest
_gitname=qtrest
pkgname=qt-rest-git
pkgver=r79.eb808b6
pkgrel=1
pkgdesc="Qt REST Client"
arch=(i686 x86_64 armv7h aarch64)
url="https://github.com/$_gitprojectname/$_gitname"
license=(MIT)
depends=('qt5-base' 'qt5-declarative')
makedepends=(cmake git)
conflicts=(qt-rest)
source=("git+https://github.com/$_gitprojectname/$_gitname#branch=aa13q-add-pkgconfig")
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$_gitname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
 
