# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=exhale
pkgver=1.2.0.1
pkgrel=2
pkgdesc="Open source xHE-AAC encoder"
arch=('i686' 'x86_64')
url="https://gitlab.com/ecodis/exhale"
license=('custom')
depends=('gcc-libs')
makedepends=('cmake')
source=("https://gitlab.com/ecodis/exhale/-/archive/v$pkgver/exhale-v$pkgver.tar.gz")
sha256sums=('d2a58b5c38c3912b9990d2b1f2376a5664dcd25a2852494a0078e6b1a145ad4c')


build() {
  cd "$pkgname-v$pkgver"

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
  cd "$pkgname-v$pkgver"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "include"/{License.htm,styles.css} -t "$pkgdir/usr/share/licenses/exhale"
}
