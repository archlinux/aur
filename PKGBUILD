# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
# Maintainer: Zhiwei Chen <condy0919@gmail.com>

_ocamlname=dot-merlin-reader
pkgname=ocaml-$_ocamlname
_pkgver=5.8-505
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
source=("${pkgname}-${_pkgver}.tbz::https://github.com/ocaml/merlin/releases/download/v${_pkgver}/merlin-${_pkgver}.tbz")
b2sums=('855fda6f9314906e08a44745683afb4ba206bf5d45076d2dfdf417b31960b6aed5c10d504b90f7bdf80bdb8b809ffcdaf0c774868d4e77b0983ccd4d642b14bc')
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
