# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: TheAifam5 <theaifam5 at gmail com>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
pkgbase=sol2
pkgname=(${pkgbase} ${pkgbase}-single)
pkgver=3.5.0
pkgrel=1
pkgdesc="C++ <-> Lua API wrapper with advanced features and top notch performance"
arch=(any)
url="https://${pkgbase}.rtfd.io"
license=(MIT)
makedepends=(python cmake git)
optdepends=(lua lua51 lua53 lua52 luajit)
conflicts=(${pkgbase})
provides=(${pkgbase})
source=(${pkgbase}-${pkgver}::https://github.com/ThePhD/${pkgbase}/archive/v${pkgver}.tar.gz)
sha512sums=('5a6ec7e16dae05ad6abea02842f62db8f64935eda438d67b2c264cbee80cee6d82200bd060387c6df837fe9f212dbe22b2772af34df1ce8bd43296dd9429558d')

build() {
  cmake \
    -S ${pkgbase}-${pkgver} \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_COMPILER=g++ \
    -Wno-dev
}

package_sol2() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm 644 ${pkgbase}-${pkgver}/LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_sol2-single() {
  cd ${pkgbase}-${pkgver}/single

  # install headers
  install -d ${pkgdir}/usr/include/sol
  python single.py --input ../include --output ${pkgdir}/usr/include/sol/sol.hpp

  install -Dm 644 ${srcdir}/${pkgbase}-${pkgver}/LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
