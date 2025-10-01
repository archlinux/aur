# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

_ocamlname=unisim_archisec
pkgname=ocaml-${_ocamlname}
pkgver=0.0.13
pkgrel=1
pkgdesc="Disassembly metadata and DBA (Dynamic Bitvector Automata) semantics of several instruction set architectures"
arch=('x86_64')
url="https://binsec.github.io"
license=('BSD-3-Clause')
depends=('gcc-libs' 'glibc' 'ocaml')
makedepends=('dune>=3.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/binsec/unisim_archisec/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('bfb98e2c0244cddf6ca6eba5910384157a7e7fe97d5fbcfb3e0f1fb794385cf305294282ba9d6246e91a5f1c4b80bf142ddb308936fba51057c4ce4ffc1d6a30')

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
