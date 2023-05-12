# Maintainer: Dennis van der Schagt <dennisschagt@gmail.com>
pkgname=eprosima-fast-dds
pkgver=2.10.1
pkgrel=2
pkgdesc="eProsima's Fast-DDS implementation"
arch=('x86_64')
url="https://github.com/eProsima/Fast-DDS"
license=('Apache')
depends=('foonathan_memory-shared' 'asio' 'tinyxml2' 'eprosima-fast-cdr')
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
source=(
    "https://github.com/eProsima/Fast-DDS/archive/v${pkgver}.tar.gz"
    "001-gcc-13-1.patch"
)
noextract=()
sha256sums=(
    '2cc2682db5dc7e87684b7f23166e2f32faf8d5c4b4a8c94c6c21211a8a38f553'
    'd4e29cda89334ddadd6d619a18dfdfaaee184cd7df7ad09c2de1e2673b2a36cb'
)
validpgpkeys=()

prepare() {
    cd Fast-DDS-${pkgver}
    patch --forward --strip=1 --input="${srcdir}/001-gcc-13-1.patch"
}

build() {
    cd "Fast-DDS-$pkgver"
    cmake -B build \
          -DCMAKE_INSTALL_PREFIX=/usr \
          .
    cmake --build build --parallel 8
}

package() {
    cd "Fast-DDS-$pkgver"
    make -C build DESTDIR="$pkgdir/" install
}
