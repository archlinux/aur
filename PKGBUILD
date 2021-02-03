# Maintainer: c0gnitivefl0w

pkgname=seadrive-gui
pkgver=2.0.12
pkgrel=0
pkgdesc="GUI part of seadrive"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/haiwen/${pkgname}"
license=('Apache')
depends=('qt5-webengine' 'qt5-tools'
         'seadrive-daemon')
makedepends=("cmake")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('1e2b8b8688a485b46e25b6884937ae0353d6c25a1802d762636b06a9d4108e06')


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
