# Maintainer: rpkak <rpkak@users.noreply.github.com>
pkgname='libblake3'
pkgver=1.4.0
pkgrel=1
epoch=
pkgdesc="the C implementations of the BLAKE3 cryptographic hash function"
arch=('x86_64')
url="https://blake3.io/"
license=('Apache')
groups=()
depends=(glibc)
makedepends=(cmake)
checkdepends=()
optdepends=()
provides=(libblake3.so)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/BLAKE3-team/BLAKE3/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('012db50d676c177842650ff55235990b8dc73d18e4e4730824773df22257fb51')
validpgpkeys=()

build() {
    cmake -B build -S "BLAKE3-$pkgver/c" -DBUILD_SHARED_LIBS=True -DCMAKE_BUILD_TYPE='Release' -DCMAKE_INSTALL_PREFIX='/usr' -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "BLAKE3-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
