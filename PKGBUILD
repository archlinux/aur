# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=exhale
pkgver=1.0.8
pkgrel=1
pkgdesc="Open source xHE-AAC encoder"
arch=('i686' 'x86_64')
url="https://gitlab.com/ecodis/exhale"
license=('custom')
depends=('gcc-libs')
makedepends=('cmake')
options=('staticlibs')
source=("https://gitlab.com/ecodis/exhale/-/archive/v$pkgver/exhale-v$pkgver.tar.bz2")
sha256sums=('98648eaf6c8b3bb0cec1a8f5077d06531db66335b73f0f543f4f8e4689751b39')


build() {
  cd "$pkgname-v$pkgver"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  make -C "_build"
}

package() {
  cd "$pkgname-v$pkgver"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "include"/{License.htm,styles.css} -t "$pkgdir/usr/share/licenses/exhale"
}
