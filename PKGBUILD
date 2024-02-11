# Contributor: database64128 <free122448@hotmail.com>
# Contributor: Ye Jingchen <ye.jingchen@gmail.com>
pkgname=uvw
pkgver=3.3.0_libuv_v1.47
pkgrel=1
pkgdesc="Header-only, event based, tiny and easy to use libuv wrapper in modern C++"
arch=(x86_64)
url="https://github.com/skypjack/${pkgname}"
license=(MIT)
depends=(libuv)
makedepends=(cmake)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
b2sums=('8f639048b8ed2cd178d93ace555151b70d46095c5815191e2def3e04b60e9e80a5555bfdedf8bba5ec845e46736a969b43e3e57f5125a5535ef228cb80369586')

build() {
  cmake \
    -S ${pkgname}-${pkgver} \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DFETCH_LIBUV=OFF \
    -DUSE_LIBCPP=OFF \
    -Wno-dev
  cmake --build build --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm 644 ${pkgname}-${pkgver}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
