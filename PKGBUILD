# Maintainer: eolianoe <eolianoe [at] gmail [DoT] com>

pkgname=seadrive-gui
pkgver=1.0.2
pkgrel=1
pkgdesc="GUI part of seadrive"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/haiwen/${pkgname}"
license=('Apache')
depends=('qt5-webengine' 'qt5-tools'
         'seadrive-daemon')
makedepends=("cmake")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('67f1a624d71fe9869c6030031858fc728d024a4c4e9674f6ff3dbae3c5f271f9')

prepare() {
  cd "${srcdir}"

  rm -rf build
  mkdir -p build
}

build () {
  cd "$srcdir/build"

  cmake \
    -DBUILD_SPARKLE_SUPPORT=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${srcdir}/${pkgname}-${pkgver}"

  make
}

package () {
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}" install
}
