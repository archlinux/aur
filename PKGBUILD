# Maintainer: x2b <psaoj.10.Toranaga-San@spamgourmet.com>

pkgname=highs
pkgver=1.11.0
pkgrel=1
pkgdesc="Linear optimization software"
arch=('i686' 'x86_64')
_pkgname=HiGHS
url="https://github.com/ERGO-Code/HiGHS"
license=('MIT')
depends=('gcc-libs' 'zlib' 'glibc')
makedepends=('cmake')
source=("https://github.com/ERGO-Code/HiGHS/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2b44b074cf41439325ce4d0bbdac2d51379f56faf17ba15320a410d3c1f07275')

prepare() {
    cmake -B "build_${pkgver}" -S "$srcdir/${_pkgname}-${pkgver}" \
      -DCMAKE_C_FLAGS="${CFLAGS}" \
      -DCMAKE_CXX_FLAGS="${CXXFLAGS}" \
      -DCMAKE_EXE_LINKER_FLAGS="${LDFLAGS}" \
      -DCMAKE_SHARED_LINKER_FLAGS="${LDFLAGS}" \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -Wno-dev
}

build() {
    cmake --build "build_${pkgver}"
}

check() {
    cmake --build "build_${pkgver}" --target test
}

package() {
    DESTDIR="$pkgdir/" cmake --install "build_${pkgver}"
    install -Dm644 "$srcdir/${_pkgname}-${pkgver}/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
