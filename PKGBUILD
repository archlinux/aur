# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

_ocamlname=unisim_archisec
pkgname=ocaml-${_ocamlname}
pkgver=0.0.11
pkgrel=1
pkgdesc="Disassembly metadata and DBA (Dynamic Bitvector Automata) semantics of several instruction set architectures"
arch=('x86_64')
url="https://binsec.github.io"
license=('BSD-3-Clause')
depends=('gcc-libs' 'glibc' 'ocaml')
makedepends=('dune>=3.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/binsec/unisim_archisec/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('aced2245b6ecbf737d68b095e13756e2d4581e97032d62f567b87d0a1f2639039343ca6bfc157775b4e20eba2b972493a85ca1f7abd9f8b5be51e0f2bd59d1ee')

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
