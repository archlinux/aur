# Maintainer: Antonio Vázquez Blanco <antoniovazquezblanco@gmail.com>

pkgname=argtable3
pkgver=3.3.1
pkgrel=1
_srcdir="argtable-v${pkgver}"
arch=('any')
pkgdesc='A single-file, ANSI C, command-line parsing library that parses GNU-style command-line options.'
url='https://www.argtable.org/'
makedepends=('cmake')
source=("https://github.com/argtable/argtable3/releases/download/v${pkgver}/argtable-v${pkgver}.tar.gz")
sha512sums=('3c6c3054365746c311081d349970a42c347587260a87b38111f324ee0f9d5e5c277a50f27cc0832f866ae596054c94666108950599b3ded98db638fb41f58ff9')

build() {
    cmake -B build -S "${_srcdir}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_SHARED_LIBS=ON
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 "${_srcdir}/LICENSE"
}
