# Maintainer: Dennis van der Schagt <dennisschagt@gmail.com>
pkgname=eprosima-fast-dds
pkgver=2.11.0
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
	"001-include-cstdint.patch"
)
noextract=()
sha256sums=(
	'afaf43fbee90d6dbecbbe7c363860c4963f8db2f4be94dc7c61a27bfdf841b83'
	'9656a7c2780040a922ecd85b9ba046ec72375a394b5ae199d570d1c1b7e82abf'
)
validpgpkeys=()

prepare() {
    cd Fast-DDS-${pkgver}
    patch --forward --strip=1 --input="${srcdir}/001-include-cstdint.patch"
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
