# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=exhale
pkgver=1.1.0
pkgrel=2
pkgdesc="Open source xHE-AAC encoder"
arch=('i686' 'x86_64')
url="https://gitlab.com/ecodis/exhale"
license=('custom')
depends=('gcc-libs')
makedepends=('cmake')
source=("https://gitlab.com/ecodis/exhale/-/archive/v$pkgver/exhale-v$pkgver.tar.bz2")
sha256sums=('9e1fed7d1dc5c757cef04e773424ae50c879655d362cb602d2647b26e371402f')


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
