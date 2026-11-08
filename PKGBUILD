# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
# Maintainer: Zhiwei Chen <condy0919@gmail.com>

_ocamlname=dot-merlin-reader
pkgname=ocaml-$_ocamlname
_pkgver=5.9.1-505
pkgver=${_pkgver/-/_} # No hypen in $pkgver
pkgrel=1
pkgdesc="Reads config files for merlin"
arch=('x86_64')
depends=('glibc' 'ocaml' 'ocaml-csexp' 'ocaml-merlin-lib')
makedepends=(
	'dune'
	#'ocaml-alcotest'
)
checkdepends=('jq' 'ocaml-menhir')
url="https://ocaml.github.io/merlin"
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ocaml/merlin/archive/refs/tags/v${_pkgver}.tar.gz")
b2sums=('146bf1502dcf2b5be132a1d1ef31f22a21b2f179b04e0cfec8adeeec0d38b4b6270a239cbe08394d942edfcc3aa4d3f15e0d89aeb6287ea7211de09259269013')
options=('!strip')

build() {
    cd $srcdir/merlin-$_pkgver
    dune build -p $_ocamlname
}

# check() {
#     cd $srcdir/merlin-$_pkgver
#     dune test --release --verbose
# }

package() {
    cd $srcdir/merlin-$_pkgver

    DESTDIR="${pkgdir}" dune install -p $_ocamlname \
	   --prefix "/usr" \
	   --libdir "/usr/lib/ocaml" \
	   --docdir "/usr/share/doc/$pkgname"

    install -d $pkgdir/usr/share/licenses/$pkgname/
    mv $pkgdir/usr/share/doc/$pkgname/$_ocamlname/LICENSE $pkgdir/usr/share/licenses/$pkgname/
}
