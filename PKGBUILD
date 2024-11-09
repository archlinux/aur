# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: David Wu <xdavidwuph@gmail.com>
pkgname=intel-ipsec-mb
pkgver=2.0
pkgrel=1
pkgdesc="Intel(R) Multi-Buffer Crypto for IPsec Library"
url=https://github.com/intel/intel-ipsec-mb
arch=(x86_64)
license=(BSD-3-Clause)
depends=(glibc)
makedepends=(
    cmake
    nasm
)
source=($pkgname-$pkgver.tar.gz::https://github.com/intel/intel-ipsec-mb/archive/v$pkgver.tar.gz)
b2sums=('c806a50ed5c8aa52cca6207035f2ce7c77780a631192236f3d1b838de11363e352e1ae7e5029e40f140144278860dcb5aaf0782f82c9ff5277228332d555b38c')

build() {
    cmake -B build -S "$pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure -j $(nproc)
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 $pkgname-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
