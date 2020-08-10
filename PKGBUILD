# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=exhale
pkgver=1.0.6
pkgrel=2
pkgdesc="Open source xHE-AAC encoder"
arch=('i686' 'x86_64')
url="https://gitlab.com/ecodis/exhale"
license=('custom')
depends=('gcc-libs')
makedepends=('cmake')
options=('staticlibs')
source=("https://gitlab.com/ecodis/exhale/-/archive/v$pkgver/exhale-v$pkgver.tar.bz2")
sha256sums=('fded029bfbba3c158f8da1ada0c98ba3c3c5126507cd3a4a1d5c645a028c640b')


build() {
  cd "$pkgname-v$pkgver"

  mkdir -p "_build" && cd "_build"
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    "../"
  make
}

package() {
  cd "$pkgname-v$pkgver"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "include"/{License.htm,styles.css} -t "$pkgdir/usr/share/licenses/exhale"
}
