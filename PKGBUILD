# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=args
pkgver=6.4.7
pkgrel=1
pkgdesc="Simple header-only C++ argument parser library"
arch=(any)
url="https://github.com/Taywee/args"
license=(MIT)
makedepends=(cmake)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Taywee/args/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ae53d120609ecf44ff079b6992b4b54d6c25e9d647d06f46d9f68fe1476c0454')

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
