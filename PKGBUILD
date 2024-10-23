# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Jerome Leclanche <jerome@leclan.ch>

pkgname=stormlib-git
pkgver=9.26.r14.gcc17c9b
pkgrel=1
pkgdesc="A C/C++ API to read and write MPQ files"
arch=(x86_64 i686)
url="https://github.com/ladislav-zezula/stormlib"
license=(MIT)
#depends=(bzip2 zlib)
makedepends=(git cmake)
provides=(stormlib)
conflicts=(stormlib)
source=("git+https://github.com/ladislav-zezula/stormlib.git")
sha256sums=("SKIP")

pkgver() {
  cd "stormlib"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "stormlib" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -D stormlib/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
