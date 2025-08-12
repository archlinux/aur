# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

_ocamlname=unisim_archisec
pkgname=ocaml-${_ocamlname}
pkgver=0.0.12
pkgrel=1
pkgdesc="Disassembly metadata and DBA (Dynamic Bitvector Automata) semantics of several instruction set architectures"
arch=('x86_64')
url="https://binsec.github.io"
license=('BSD-3-Clause')
depends=('gcc-libs' 'glibc' 'ocaml')
makedepends=('dune>=3.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/binsec/unisim_archisec/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('f150f9ac7e3a8f5292cb50e05e1065e447a3d5545d0f4ead4796b2ab4f33d50a55346f3f237efe30c7405f8c6f1dc29bb636ee7b6830c1714093c356f0b146b5')

build() {
    cd $srcdir/${_ocamlname}-${pkgver}
    dune build -p $_ocamlname
}

check() {
    cd $srcdir/${_ocamlname}-${pkgver}
    dune test
}

package() {
    cd $srcdir/${_ocamlname}-${pkgver}
    DESTDIR=$pkgdir dune install --prefix "/usr" --libdir "/usr/lib/ocaml" --docdir "/usr/share/doc"

    install -d  $pkgdir/usr/share/licenses/$pkgname/
    mv $pkgdir/usr/share/doc/$_ocamlname/LICENSE.md $pkgdir/usr/share/licenses/$pkgname/
    mv $pkgdir/usr/share/doc/$_ocamlname $pkgdir/usr/share/doc/$pkgname
}
