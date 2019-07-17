# Maintainer: Sergey Kostyuchenko <derfenix@gmail.com>

pkgname=corectrl
pkgver=1.0.4
pkgrel=1
pkgdesc="Core control application"
url="https://gitlab.com/corectrl/corectrl"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('procps-ng' 'hwids')
makedepends=('cmake>=3.3' 'botan>=2.2.0' 'qt5-base>=5.9' 'qt5-tools' 'kauth' 'karchive' 'gcc>=8' 'extra-cmake-modules' 'qt5-charts' 'qt5-quickcontrols' 'qca')
optdepends=(
	'vulkan-tools: For vulkaninfo'
	'mesa-demos: For glxinfo',
	'util-linux: For lscpu'
)
source=("https://gitlab.com/corectrl/corectrl/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
sha512sums=('71366210534bfc31dafdcbc66b89f614e4303294d52a5a4f90d48633721b550eb43cdead7cb89b76ac024c0c924995e61e5721f43db973c0e77d46e561297c14')

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
