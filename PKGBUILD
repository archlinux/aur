# Maintainer: rpkak <rpkak@users.noreply.github.com>
pkgname='libblake3'
pkgver=1.4.1
pkgrel=2
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
sha256sums=('33020ac83a8169b2e847cc6fb1dd38806ffab6efe79fe6c320e322154a3bea2c')
validpgpkeys=()

build() {
    echo "BLAKE3-$pkgver/c"
    cmake -B "BLAKE3-$pkgver/c/build" -S "BLAKE3-$pkgver/c" -DBUILD_SHARED_LIBS=True -DCMAKE_BUILD_TYPE='Release' -DCMAKE_INSTALL_PREFIX='/usr' -Wno-dev
    cmake --build "BLAKE3-$pkgver/c/build"
}

package() {
    DESTDIR="$pkgdir" cmake --install "BLAKE3-$pkgver/c/build"
    install -Dm644 "BLAKE3-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
