# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=sfl-git
pkgver=1.6.0.r0.g9d76d9e
pkgrel=2
pkgdesc="C++11 header-only library. Small and static vector. Small and static flat map/set. Compact vector. Segmented vector"
arch=(any)
url="https://github.com/slavenf/sfl-library"
license=(Zlib)
makedepends=(git cmake)
provides=(sfl)
conflicts=(sfl)
source=("git+https://github.com/slavenf/sfl-library.git")
sha256sums=('SKIP')

pkgver() {
  cd sfl-library
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "sfl-library" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -D sfl-library/LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
