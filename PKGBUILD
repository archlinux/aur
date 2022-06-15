# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=argh
pkgver=1.3.2
pkgrel=1
pkgdesc="Minimalist argument handler"
arch=(any)
url="https://github.com/adishavit/argh"
license=(BSD)
makedepends=(cmake clang)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/adishavit/argh/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4b76d8c55e97cc0752feee4f00b99dc58464dd030dea9ba257c0a7d24a84f9dd')

prepare() {
  cd "${pkgname}-${pkgver}"
  [[ -d build ]] || mkdir build
}

build() {
  cd "${pkgname}-${pkgver}/build"
  cmake .. \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
  cd "${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  install -D ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
