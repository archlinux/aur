# Maintainer: Jochem Kuipers <jochem@kuipers.cc>
pkgname=breeze-enhanced
pkgver=6.4
pkgrel=1
pkgdesc="A fork of KDE Breeze decoration with additional options (gradient, opacity, macOS-like buttons)"
arch=('x86_64' 'aarch64')
url="https://github.com/tsujan/BreezeEnhanced"
license=('GPL3')
depends=('kdecoration' 'kwin' 'qt5-base' 'extra-cmake-modules')
makedepends=('cmake' 'git')
source=("${pkgname}::git+https://github.com/tsujan/BreezeEnhanced.git#tag=V${pkgver}")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}"
  # Create build directory
  mkdir -p build
}

build() {
  cd "${srcdir}/${pkgname}/build"
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd "${srcdir}/${pkgname}/build"
  make DESTDIR="${pkgdir}" install
}

