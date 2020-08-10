# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=exhale-git
pkgver=1.0.6.r1.g051900f
pkgrel=2
pkgdesc="Open source xHE-AAC encoder"
arch=('i686' 'x86_64')
url="https://gitlab.com/ecodis/exhale"
license=('custom')
depends=('gcc-libs')
makedepends=('git' 'cmake')
provides=('exhale')
conflicts=('exhale')
options=('staticlibs')
source=("git+https://gitlab.com/ecodis/exhale.git")
sha256sums=('SKIP')


pkgver() {
  cd "exhale"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "exhale"

  mkdir -p "_build" && cd "_build"
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    "../"
  make
}

package() {
  cd "exhale"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "include"/{License.htm,styles.css} -t "$pkgdir/usr/share/licenses/exhale"
}
