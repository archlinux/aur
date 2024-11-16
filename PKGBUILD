# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Hurstel Alexandre <a.hurstel@unistra.fr>

pkgname=astex-git
pkgver=r461.3c1e70c
pkgrel=1
pkgdesc="ASTex is an open-source library for texture analysis and synthesis."
arch=(i686 x86_64)
url="https://astex-icube.github.io"
license=(LGPL-2.1-or-later)
depends=()
makedepends=(git cmake cgal glfw glu glew eigen boost insight-toolkit libpng openexr suitesparse onetbb)
provides=(astex)
conflicts=(astex)
options=(!lto)
source=("git+https://github.com/ASTex-ICube/ASTex.git")
b2sums=('SKIP')

pkgver() {
  cd "ASTex"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  export CFLAGS+=" -Wno-error=format-security"
  export CXXFLAGS+=" -Wno-error=format-security"

  cmake -B build -S "ASTex" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
