# Maintainer: c0gnitivefl0w

pkgname=seadrive-gui
pkgver=2.0.16
pkgrel=1
pkgdesc="GUI part of seadrive"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/haiwen/${pkgname}"
license=('Apache')
depends=('qt5-webengine' 'qt5-tools'
         'seadrive-daemon')
makedepends=("cmake")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('76778f5c1d94a4d78ac4b6558f8be792106c3e950e1c6801933e1781cae465fc')

prepare() {
  cd "${srcdir}"

  rm -rf build
  mkdir -p build

  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i '1iadd_definitions(-DGLIB_VERSION_MIN_REQUIRED=GLIB_VERSION_2_26)' CMakeLists.txt
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
