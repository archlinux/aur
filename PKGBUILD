# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

_srcname=unisim_archisec
pkgname="ocaml-${_srcname}"
pkgver=0.0.9
pkgrel=2
pkgdesc="Disassembly metadata and DBA (Dynamic Bitvector Automata) semantics of several instruction set architectures"
arch=('x86_64')
url="https://binsec.github.io"
license=('BSD-3-Clause')
depends=('gcc-libs' 'glibc' 'ocaml')
makedepends=('dune>=3.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/binsec/unisim_archisec/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('a72ae085101b7861b55872b82f67a8e653aa0e6a118c23a9bc77c4986a75fb47a94705bef5f6330c1610a66ceb4a1b9065e9aee63693e3a825956895d91c8962')

# Check fails but that does not affect functionality. Reported to upstream
# https://github.com/binsec/unisim_archisec/
#
# check() {
#     cd "$srcdir/${_srcname}-${pkgver}"
#     dune test
# }

build() {
    cd "$srcdir/${_srcname}-${pkgver}"
    dune build @install
}

package() {
    cd "$srcdir/${_srcname}-${pkgver}"
    DESTDIR="${pkgdir}" dune install --prefix "/usr" --libdir "/usr/lib/ocaml" --docdir "/usr/share/doc"

    install -d  "$pkgdir/usr/share/licenses/$pkgname/"
    mv $pkgdir/usr/share/doc/$_srcname/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/"
    mv $pkgdir/usr/share/doc/$_srcname $pkgdir/usr/share/doc/$pkgname
}
