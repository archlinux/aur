# Maintainer: Sergey Kostyuchenko <derfenix@gmail.com>

pkgname=corectrl
pkgver=1.1.0
pkgrel=1
pkgdesc="Core control application"
url="https://gitlab.com/corectrl/corectrl"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('procps-ng' 'hwids' 'karchive' 'kauth' 'qt5-charts' 'qt5-quickcontrols2' 'botan>=2.2.0' 'qt5-base>=5.9')
makedepends=('cmake>=3.3' 'qt5-tools' 'karchive' 'gcc>=8' 'extra-cmake-modules')
optdepends=(
	'vulkan-tools: For vulkaninfo'
	'mesa-demos: For glxinfo',
	'util-linux: For lscpu'
)
source=("https://gitlab.com/corectrl/corectrl/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
sha512sums=('fdc050a78cbaa7a532b52198aa410d999b4c9a7b477dae35bb55352b0c0cd49fe951b46f3924ff6ef3cd4bb7acdd06eae74faa006c4e5ca6c9a607f2f10a9248')

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr/" -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=OFF ..
  make ${MAKEFLAGS}
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}/build" 
  sed -i -- 's/\/usr/${CMAKE_INSTALL_PREFIX}/g' src/helper/cmake_install.cmake
  make install
}
