# Maintainer: Dennis van der Schagt <dennisschagt@gmail.com>
pkgname=eprosima-fast-dds
pkgver=3.2.2
pkgrel=1
pkgdesc="eProsima's Fast-DDS implementation"
arch=('x86_64')
url="https://github.com/eProsima/Fast-DDS"
license=('Apache')
# Reason for limiting Asio version: https://github.com/eProsima/Fast-DDS/issues/5726
depends=('foonathan_memory' 'asio<1.33' 'tinyxml2' 'eprosima-fast-cdr')
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
source=("https://github.com/eProsima/Fast-DDS/archive/v${pkgver}.tar.gz")
noextract=()
sha256sums=('243699d3b2f9a97012d74c3369abe705aaab0700712f3d9ecbd9f705a336b044')
validpgpkeys=()

build() {
    cd "Fast-DDS-$pkgver"
    # patch -Np1 -i ../include-cstdint.patch
    cmake -B build \
          -DCMAKE_INSTALL_PREFIX=/usr \
          .
    cmake --build build --parallel 8
}

package() {
    cd "Fast-DDS-$pkgver"
    make -C build DESTDIR="$pkgdir/" install
}
