# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=args
pkgver=6.4.8
pkgrel=1
pkgdesc="Simple header-only C++ argument parser library"
arch=(any)
url="https://github.com/Taywee/args"
license=(MIT)
makedepends=(cmake)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Taywee/args/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('52ecaceb92c3865c8a210091f288b4902e0a08280327a80c4b8d8aec5d7a3bbe')

build() {
  cd "${pkgname}-${pkgver}"
  cmake . \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

check() {
  cd "${pkgname}-${pkgver}"
  ./argstest
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
