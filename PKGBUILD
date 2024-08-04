# Maintainer: Dennis van der Schagt <dennisschagt@gmail.com>
pkgname=eprosima-fast-dds
pkgver=2.14.0
pkgrel=1
pkgdesc="eProsima's Fast-DDS implementation"
arch=('x86_64')
url="https://github.com/eProsima/Fast-DDS"
license=('Apache')
depends=('foonathan_memory' 'asio' 'tinyxml2' 'eprosima-fast-cdr')
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
source=("https://github.com/eProsima/Fast-DDS/archive/v${pkgver}.tar.gz"
    "include-cstdint.patch")
noextract=()
sha256sums=('a6f12bce6b77f265cab81abde5dc2e08133be9a55bc29e573c84571d44eddbc2'
    '4c9723b3e7cf83bb58b8fa36cce7ebc2f7ec194cabe515d962a5273d08b49112')
validpgpkeys=()

build() {
    cd "Fast-DDS-$pkgver"
    patch -Np1 -i ../include-cstdint.patch
    cmake -B build \
          -DCMAKE_INSTALL_PREFIX=/usr \
          .
    cmake --build build --parallel 8
}

package() {
    cd "Fast-DDS-$pkgver"
    make -C build DESTDIR="$pkgdir/" install
}
