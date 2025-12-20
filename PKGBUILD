# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
# Maintainer: Zhiwei Chen <condy0919@gmail.com>

_ocamlname=dot-merlin-reader
pkgname=ocaml-$_ocamlname
_pkgver=5.6.1-504
pkgver=${_pkgver/-/_} # No hypen in $pkgver
pkgrel=1
pkgdesc="Reads config files for merlin"
arch=('x86_64')
depends=('glibc' 'ocaml' 'ocaml-csexp' 'ocaml-merlin-lib')
makedepends=('dune' 'ocaml-alcotest')
checkdepends=('jq' 'ocaml-menhir')
url="https://ocaml.github.io/merlin"
license=('MIT')
source=("${pkgname}-${_pkgver}.tbz::https://github.com/ocaml/merlin/releases/download/v${_pkgver}/merlin-${_pkgver}.tbz")
b2sums=('c151b0fc72cb22819894df1221053a14a1686fa37ac05d30c03671c7b26877dac70bf16e531d5f7900eae4a802949298882149be82015705502c2d859f7b8c06')
options=('!strip')

build() {
    cd $srcdir/merlin-$_pkgver
    dune build -p $_ocamlname
}

check() {
    cd $srcdir/merlin-$_pkgver
    dune test --release --verbose

}
package() {
    cd $srcdir/merlin-$_pkgver

    DESTDIR="${pkgdir}" dune install -p $_ocamlname \
	   --prefix "/usr" \
	   --libdir "/usr/lib/ocaml" \
	   --docdir "/usr/share/doc/$pkgname"

    install -d $pkgdir/usr/share/licenses/$pkgname/
    mv $pkgdir/usr/share/doc/$pkgname/$_ocamlname/LICENSE $pkgdir/usr/share/licenses/$pkgname/
}
