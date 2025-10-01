# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

_ocamlname=ptime
pkgname=ocaml-${_ocamlname}
pkgver=1.2.0
pkgrel=1
pkgdesc="Platform independent POSIX time support in pure OCaml"
arch=('x86_64')
url="https://erratique.ch/software/ptime"
license=('ISC')
depends=('glibc' 'ocaml')
makedepends=('ocaml-findlib' 'ocaml-topkg' 'ocamlbuild' 'opam')
source=("${pkgname}-${pkgver}.tar.gz::https://erratique.ch/software/ptime/releases/ptime-${pkgver}.tbz")
sha512sums=('b0c3240dd9e777a5e60b5269eb2e312fc644d29ef55e257d2f2538c03bf62274173ed36e13858c44d2dbee8fe375c9c483e705706e4aa5b3b5c4609ca6324a5c')
options=('!strip')

build() {
    cd $srcdir/$_ocamlname-$pkgver

    # --tests true still doesn't build tests.
    ocaml pkg/pkg.ml build --dev-pkg false # --tests true
}

# check() {
#     cd $srcdir/$_ocamlname-$pkgver
#     ocaml pkg/pkg.ml test
# }

package() {
    cd $srcdir/$_ocamlname-$pkgver

    opam-installer --prefix="$pkgdir/usr" --libdir='lib/ocaml' --docdir='share/doc'

    install -d $pkgdir/usr/share/licenses/$pkgname/
    mv $pkgdir/usr/share/doc/$_ocamlname/LICENSE.md $pkgdir/usr/share/licenses/$pkgname/
    mv $pkgdir/usr/share/doc/$_ocamlname $pkgdir/usr/share/doc/$pkgname

}
