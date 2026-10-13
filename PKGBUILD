# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
# Maintainer: Zhiwei Chen <condy0919@gmail.com>

_ocamlname=merlin-lib
pkgname=ocaml-$_ocamlname
pkgver=5.9
pkgrel=1
pkgdesc="Low-level compiler interfaces and the standard higher-level merlin protocol library"
arch=('x86_64')
depends=('glibc' 'ocaml' 'ocaml-csexp')
makedepends=(
	'dune'
	#'ocaml-alcotest'
)
checkdepends=('jq' 'ocaml-menhir')
url="https://ocaml.github.io/merlin"
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ocaml/merlin/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('cd7d2e67c7190695d403af057d6d98927d11155db89cad62dc61d97c2f5831c010841ef7aab506946363908aab0e9f88f441653e34b40dc70e622111a2db3051')
options=('!strip')

build() {
    cd $srcdir/merlin-$pkgver
    dune build -p merlin-lib
}

# check() {
#     cd $srcdir/merlin-$pkgver
#     dune test --release --verbose
# }

package() {
    cd $srcdir/merlin-$pkgver

    DESTDIR="${pkgdir}" dune install -p merlin-lib \
	   --prefix "/usr" \
	   --libdir "/usr/lib/ocaml" \
	   --docdir "/usr/share/doc/$pkgname"

    install -d $pkgdir/usr/share/licenses/$pkgname/
    mv $pkgdir/usr/share/doc/$pkgname/$_ocamlname/LICENSE $pkgdir/usr/share/licenses/$pkgname/
}
