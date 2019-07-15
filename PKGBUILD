# Maintainer: Sergey Kostyuchenko <derfenix@gmail.com>

pkgname=corectrl
pkgver=1.0.1
pkgrel=1
pkgdesc="Core control application"
url="https://gitlab.com/corectrl/corectrl"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('procps-ng' 'hwids')
makedepends=('cmake>=3.3' 'botan>=2.2.0' 'qt5-base>=5.9' 'qt5-tools' 'kauth' 'karchive' 'gcc>=7.2' 'extra-cmake-modules' 'qt5-charts')
optdepends=(
	'vulkan-tools: For vulkaninfo'
	'mesa-demos: For glxinfo',
	'util-linux: For lscpu'
)
source=("https://gitlab.com/corectrl/corectrl/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2" "fix_abs_paths.patch")
sha512sums=('fb50d37fa025e57aa5da0a1897d2a009a096f4e45259b2d14391d987eed573aaa418848a1257c4278339b8a475fd68f72070a5a030be56b77483edda1662f9a5'
	'342bb3c12163bb7f4fc61b159d4f7f82320c3e9a18707fcd5eb7dab8ce878a8cb3b3893b3f6276e221b32498f6f5638feca30ee83b75b9277c1b5840c2f72f6f')

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/" -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=OFF ..
  make ${MAKEFLAGS}
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}/build"
  patch -p0 <../../../fix_abs_paths.patch
  make install
}
