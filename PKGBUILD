# Maintainer: Jun Bo Bi <jambonmcyeah@gmail.com>

pkgname=netcoredbg
pkgver=latest
pkgrel=1
pkgdesc='Adds communication between KDE and your smartphone'
url='https://github.com/Samsung/netcoredbg'
license=(MIT)
arch=(x86_64)
depends=(dotnet-host dotnet-runtime dotnet-sdk)
makedepends=(git)
optdepends=()
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
  mkdir -p build
}

build() {
  cd build
  CC=clang CXX=clang++ \
  cmake ../netcoredbg-$pkgver \
    -DDOTNET_DIR=/opt/dotnet \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_LIBEXECDIR=lib
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
