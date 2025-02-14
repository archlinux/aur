# Maintainer: Dennis van der Schagt <dennisschagt@gmail.com>
pkgname=eprosima-fast-dds
pkgver=3.1.2
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
source=("https://github.com/eProsima/Fast-DDS/archive/v${pkgver}.tar.gz")
noextract=()
sha256sums=('4aaafba605467990d33ee4f719456296cb52928f5b0b6187fecb06bf16058685')
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
