# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=casclib
pkgver=2.1
pkgrel=2
pkgdesc="Open-source implementation of library for reading CASC storages from Blizzard games"
arch=(x86_64)
url="http://www.zezula.net/en/casc/casclib.html"
license=(MIT)
depends=(gcc-libs)
makedepends=(cmake)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ladislav-zezula/CascLib/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('1c77464b7b7dbf1f6a14cf220dc0eb6c9a36a7006ad8a77ae2803fe4bfd3058c')

prepare() {
  cd "CascLib-${pkgver}"
  [[ -d build ]] || mkdir build
}

build() {
  cd "CascLib-${pkgver}/build"
  cmake .. \
    -DCMAKE_BUILD_TYPE=None \
    -DCASC_BUILD_STATIC_LIB=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
  cd "CascLib-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  install -D ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
