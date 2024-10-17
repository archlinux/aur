# Maintainer: Dennis van der Schagt <dennisschagt@gmail.com>
pkgname=eprosima-fast-dds
pkgver=3.1.0
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
source=(
	"https://github.com/eProsima/Fast-DDS/archive/v${pkgver}.tar.gz"
	"template-id-cdtor.patch"
)
noextract=()
sha256sums=(
	'8d7535bfb25b150dd3bc4a33e09c60d621054cd4c9f03e342cee98622d7f5645'
	'772b0759146c070ffef01503990d8612c6d621b4e1c953cfb95ad618e8f86212'
)
validpgpkeys=()

build() {
    cd "Fast-DDS-$pkgver"
    # patch -Np1 -i ../include-cstdint.patch
    patch -Np1 -i ../template-id-cdtor.patch
    cmake -B build \
          -DCMAKE_INSTALL_PREFIX=/usr \
          .
    cmake --build build --parallel 8
}

package() {
    cd "Fast-DDS-$pkgver"
    make -C build DESTDIR="$pkgdir/" install
}
