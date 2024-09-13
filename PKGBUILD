# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

_srcname=unisim_archisec
pkgname="ocaml-${_srcname}"
pkgver=0.0.9
pkgrel=1
pkgdesc="Disassembly metadata and DBA (Dynamic Bitvector Automata) semantics of several instruction set architectures"
arch=('x86_64')
url="https://binsec.github.io"
license=('BSD-3-Clause')
depends=('gcc-libs' 'glibc' 'ocaml')
makedepends=('dune>=3.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/binsec/unisim_archisec/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('b42d9808e54789e11baf8fd7f5e2fb0d63185475ca6d5d905c14ba82fea6320a0e2a55a6986fa54b9c4bd3dc917c9959cf27f8e42f2bc5a7d4b39d05e1a4fc39')

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
