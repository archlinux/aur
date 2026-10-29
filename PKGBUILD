# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: David Wu <xdavidwuph@gmail.com>
pkgname=intel-ipsec-mb
pkgver=3.0.1
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
b2sums=('6a0e4b2406182d0f831551cfd462adcafc0d033bfdba88be1ef0fb2eef30f4e69a33a7a1177d5136d5e16c9f6827ca93b2498eb192a0ddf405782a328186edee')

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
