# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=exhale-git
pkgver=1.1.9.1.r0.g4ef4bc3
pkgrel=1
pkgdesc="Open source xHE-AAC encoder"
arch=('i686' 'x86_64')
url="https://gitlab.com/ecodis/exhale"
license=('custom')
depends=('gcc-libs')
makedepends=('git' 'cmake')
provides=("exhale=$pkgver")
conflicts=('exhale')
source=("git+https://gitlab.com/ecodis/exhale.git")
sha256sums=('SKIP')


pkgver() {
  cd "exhale"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "exhale"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DBUILD_SHARED_LIBS=ON \
    ./
  make -C "_build"
}

package() {
  cd "exhale"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "include"/{License.htm,styles.css} -t "$pkgdir/usr/share/licenses/exhale"
}
