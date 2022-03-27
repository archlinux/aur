# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: TheAifam5 <theaifam5 at gmail com>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
pkgbase=sol2
pkgname=(${pkgbase} ${pkgbase}-single)
pkgver=3.2.3
pkgrel=3
pkgdesc="C++ <-> Lua API wrapper with advanced features and top notch performance"
arch=(any)
url="https://${pkgbase}.rtfd.io"
license=(MIT)
makedepends=(python cmake git)
optdepends=(lua lua51 lua53 lua52 luajit)
conflicts=(${pkgbase})
provides=(${pkgbase})
source=(${pkgbase}-${pkgver}::https://github.com/ThePhD/${pkgbase}/archive/v${pkgver}.tar.gz)
sha512sums=('448be11555725ddce5ea8d56d793da529c1bb969a4f444ad840044c49a047a5af2abe96d7bf17763246a397eddb4a34e6d299adb14ad3f30f6193f631f27c239')

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
