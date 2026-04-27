# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=args
pkgver=6.4.13
pkgrel=1
pkgdesc="Simple header-only C++ argument parser library"
arch=(any)
url="https://github.com/Taywee/args"
license=(MIT)
makedepends=(cmake)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Taywee/args/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('96a41db97ae6ee3e065b26ad3b1bd4c63a20d57121004c560a4f008ebcb0884f')

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
