
pkgname=mingw-w64-clang-git
pkgver=r94.7eee3ab
pkgrel=1
pkgdesc="MinGW clang wrapper (wclang)"
url="https://github.com/tpoechtrager/wclang"
arch=('x86_64' 'i686')
license=(GPL)
depends=('mingw-w64-gcc' 'clang')
makedepends=('cmake' 'git')
provides=('mingw-w64-clang')
conflicts=('mingw-w64-clang')
source=("git+https://github.com/tpoechtrager/wclang.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/wclang"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/wclang"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "${srcdir}/wclang"
  make DESTDIR="${pkgdir}" install
}

