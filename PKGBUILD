# Maintainer: x2b <psaoj.10.Toranaga-San@spamgourmet.com>

pkgname=highs
pkgver=1.8.1
pkgrel=3
pkgdesc="Linear optimization software"
arch=('i686' 'x86_64')
_pkgname=HiGHS
url="https://github.com/ERGO-Code/HiGHS"
license=('MIT')
depends=('gcc-libs' 'zlib' 'glibc')
makedepends=('cmake')
source=("https://github.com/ERGO-Code/HiGHS/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a0d09371fadb56489497996b28433be1ef91a705e3811fcb1f50a107c7d427d1')

prepare() {
    cmake -B build -S "$srcdir/${_pkgname}-${pkgver}" \
      -DCMAKE_C_FLAGS="${CFLAGS}" \
      -DCMAKE_CXX_FLAGS="${CXXFLAGS}" \
      -DCMAKE_EXE_LINKER_FLAGS="${LDFLAGS}" \
      -DCMAKE_SHARED_LINKER_FLAGS="${LDFLAGS}" \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -Wno-dev
}

build() {
    cmake --build build
}

check() {
    cmake --build build --target test
}

package() {
    DESTDIR="$pkgdir/" cmake --install build
    install -Dm644 "$srcdir/${_pkgname}-${pkgver}/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
