# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=casclib-git
pkgver=2.1.r35.ge078936
pkgrel=1
pkgdesc="Open-source implementation of library for reading CASC storages from Blizzard games"
arch=(x86_64)
url="http://www.zezula.net/en/casc/casclib.html"
license=(MIT)
depends=(gcc-libs zlib)
makedepends=(git cmake)
provides=(casclib)
conflicts=(casclib)
source=("git+https://github.com/ladislav-zezula/CascLib.git")
sha256sums=('SKIP')

pkgver() {
  cd "CascLib"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "CascLib"
  [[ -d build ]] || mkdir build
}

build() {
  cd "CascLib/build"
  cmake .. \
    -DCMAKE_BUILD_TYPE=None \
    -DCASC_BUILD_STATIC_LIB=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
  cd "CascLib/build"
  make DESTDIR="${pkgdir}" install
  install -D ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
