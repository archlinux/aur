# Maintainer: Antonio Vázquez Blanco <antoniovazquezblanco@gmail.com>

pkgname=argtable3
pkgver=3.2.2
_commit=f25c624
pkgrel=1
arch=('any')
pkgdesc='A single-file, ANSI C, command-line parsing library that parses GNU-style command-line options.'
url='https://www.argtable.org/'
makedepends=('cmake')
source=("https://github.com/argtable/argtable3/archive/refs/tags/v${pkgver}.${_commit}.tar.gz")
sha512sums=('623197142fd1749b2fd5bc3e51758ae49c58ec8699b6afa5ecb2d0199d98f9c05366f92c5169c8039b5c417f4774fb4a09c879a7b04ddbed9d5e43585692ed7f')

build() {
    cmake -B build -S "${pkgname}-${pkgver}.${_commit}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_SHARED_LIBS=ON
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 ${pkgname}-${pkgver}.${_commit}/LICENSE
}
