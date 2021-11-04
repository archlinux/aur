# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=exhale
pkgver=1.1.8
pkgrel=1
pkgdesc="Open source xHE-AAC encoder"
arch=('i686' 'x86_64')
url="https://gitlab.com/ecodis/exhale"
license=('custom')
depends=('gcc-libs')
makedepends=('cmake')
source=("https://gitlab.com/ecodis/exhale/-/archive/v$pkgver/exhale-v$pkgver.tar.bz2")
sha256sums=('939a78c0c9c6671f3c76573d3d3a9c21a5bb792e92597de320abb89c45af3c82')


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
