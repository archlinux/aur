# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

_ocamlname=unisim_archisec
pkgname=ocaml-${_ocamlname}
pkgver=0.0.14
pkgrel=1
pkgdesc="Disassembly metadata and DBA (Dynamic Bitvector Automata) semantics of several instruction set architectures"
arch=('x86_64')
url="https://binsec.github.io"
license=('BSD-3-Clause')
depends=('glibc' 'libgcc' 'libstdc++' 'ocaml')
makedepends=('dune>=3.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/binsec/unisim_archisec/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('22f9bbffd9535ce80bd962e7925e2be8a61b391168e8ce70f0c5c7a6974d34accd032aeb76761d6612cdb2cd98b61b280d44ad45e65dc647c53fa2f3f159d113')

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
