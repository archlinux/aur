# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=isoimagewriter
pkgver=1.0.0
pkgrel=1
pkgdesc="Tool to write a .iso file to a USB disk"
arch=("x86_64" "i686")
url="https://community.kde.org/ISOImageWriter"
license=('GPL3')
depends=('qgpgme' 'kiconthemes' 'kcrash' 'solid')
makedepends=('cmake' 'extra-cmake-modules' 'python')
source=("https://download.kde.org/stable/isoimagewriter/${pkgver}/isoimagewriter-${pkgver}.tar.xz"{,.sig})
sha512sums=('d50e8146cfde12d940ccfc1ed8ad71a69d203054e470d52e274589aa38d6fbdb018a79db4b63725c7b37acfedfa36b211cc79437e3f12668b8499d9ece3ee562'
            'SKIP')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D') # Jonathan Esk-Riddell

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake \
    ../$pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
