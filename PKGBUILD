# Maintainer: rpkak <rpkak@users.noreply.github.com>
pkgname='libblake3'
pkgver=1.5.1
pkgrel=1
epoch=
pkgdesc="the C implementations of the BLAKE3 cryptographic hash function"
arch=('x86_64')
url="https://blake3.io/"
license=('Apache-2.0')
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
sha256sums=('822cd37f70152e5985433d2c50c8f6b2ec83aaf11aa31be9fe71486a91744f37')
validpgpkeys=()

build() {
    cmake -B "BLAKE3-$pkgver/c/build" -S "BLAKE3-$pkgver/c" -DBUILD_SHARED_LIBS=True -DCMAKE_BUILD_TYPE='Release' -DCMAKE_INSTALL_PREFIX='/usr' -Wno-dev
    cmake --build "BLAKE3-$pkgver/c/build"
}

package() {
    DESTDIR="$pkgdir" cmake --install "BLAKE3-$pkgver/c/build"
    install -Dvm644 "BLAKE3-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
