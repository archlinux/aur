# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=recastnavigation-git
pkgver=r744.9337e12
pkgrel=1
pkgdesc="Navigation-msh Toolset for Games"
url="https://github.com/recastnavigation/recastnavigation"
arch=(x86_64)
license=('Zlib')
makedepends=(git cmake sdl2 glut)
depends=(sdl2 glut)
provides=('recastnavigation')
conflicts=('recastnavigation')
_pkgname=recastnavigation
source=("git+https://github.com/recastnavigation/recastnavigation.git")
sha256sums=("SKIP")

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p "$srcdir/${_pkgname}/build"
  cd "$srcdir/${_pkgname}/build"
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
        ..
  make
}

package() {
  cd "${srcdir}/${_pkgname}/build"
  make DESDIR=${pkgdir} install
}
