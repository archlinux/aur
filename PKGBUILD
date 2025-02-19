# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

_ocamlname=unisim_archisec
pkgname=ocaml-${_ocamlname}
pkgver=0.0.10
pkgrel=1
pkgdesc="Disassembly metadata and DBA (Dynamic Bitvector Automata) semantics of several instruction set architectures"
arch=('x86_64')
url="https://binsec.github.io"
license=('BSD-3-Clause')
depends=('gcc-libs' 'glibc' 'ocaml')
makedepends=('dune>=3.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/binsec/unisim_archisec/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('0a3b4591ab25d3b6582778abe725735c5dbd85b1ea5771084c78ac096b33e39cc80a67698f4bd99dce116b573cfb0248e96d2ed30d17bca615c9f6010a1c9ff0')

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
