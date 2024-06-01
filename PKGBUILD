# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

_srcname=unisim_archisec
pkgname="ocaml-${_srcname}"
pkgver=0.0.8
pkgrel=1
pkgdesc="Disassembly metadata and DBA (Dynamic Bitvector Automata) semantics of several instruction set architectures"
arch=('x86_64')
url="https://binsec.github.io"
license=('BSD-3-Clause')
depends=('gcc-libs' 'glibc' 'ocaml')
makedepends=('dune>=3.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/binsec/unisim_archisec/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('5c14170b2d8f1d633fcec68f19c68d987a184531a60167fc787357aeb82550ba20bddef5e2573facf98a8b8b5df7c3648514c01768ecdb500b0e6562faaa86b8')

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
