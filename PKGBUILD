# Maintainer: Dennis van der Schagt <dennisschagt@gmail.com>
pkgname=eprosima-micro-xrce-dds-client
pkgver=2.4.3
pkgrel=2
pkgdesc="eProsima's XRCE DDS client"
arch=('x86_64')
url="https://github.com/eProsima/Micro-XRCE-DDS-Client"
license=('Apache')
depends=('eprosima-micro-cdr')
makedepends=('cmake')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/eProsima/Micro-XRCE-DDS-Client/archive/v${pkgver}.tar.gz")
noextract=()
sha256sums=('7a918111e8f087407db570f0cbb085202ef458617f4ccae431987b3e1ffc1362')
validpgpkeys=()

build() {
    cd "Micro-XRCE-DDS-Client-$pkgver"
    cmake -B build \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DUCLIENT_ISOLATED_INSTALL=OFF \
          -DUCLIENT_SUPERBUILD=OFF \
          -DBUILD_SHARED_LIBS=ON \
          .
    cmake --build build --parallel 8
}

package() {
    cd "Micro-XRCE-DDS-Client-$pkgver"
    make -C build DESTDIR="$pkgdir/" install
}
