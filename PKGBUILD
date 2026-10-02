# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: David Wu <xdavidwuph@gmail.com>
pkgname=intel-ipsec-mb
pkgver=3.0.0
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
b2sums=('51150b87f7874e50a2ad3716e127f2f657ed2b98181b48ae821fb4911c22a543d13b7b31caf9208bef1158d6ac2a75fe7a222d05b9e877e583e4855963fb1f92')

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
