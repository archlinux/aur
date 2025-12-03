# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
# Maintainer: Zhiwei Chen <condy0919@gmail.com>

_ocamlname=merlin-lib
pkgname=ocaml-$_ocamlname
_pkgver=5.6-504
pkgver=${_pkgver/-/_} # No hypen in $pkgver
pkgrel=1
pkgdesc="Low-level compiler interfaces and the standard higher-level merlin protocol library"
arch=('x86_64')
depends=('glibc' 'ocaml' 'ocaml-csexp')
makedepends=('dune' 'ocaml-alcotest')
checkdepends=('jq' 'ocaml-menhir')
url="https://ocaml.github.io/merlin"
license=('MIT')
source=("${pkgname}-${_pkgver}.tbz::https://github.com/ocaml/merlin/releases/download/v${_pkgver}/merlin-${_pkgver}.tbz")
b2sums=('06fead7fdc112b48611ab88f83ad34e7f125d61b171efdac9c43a5d52a6201aa7f8459f87ea29bbab7e0ec02b9fddc37d82871baf91e393da9afa63f69282783')
options=('!strip')

build() {
    cd $srcdir/merlin-$_pkgver
    dune build -p merlin-lib
}

check() {
    cd $srcdir/merlin-$_pkgver
    dune test --release --verbose
}

package() {
    cd $srcdir/merlin-$_pkgver

    DESTDIR="${pkgdir}" dune install -p merlin-lib \
	   --prefix "/usr" \
	   --libdir "/usr/lib/ocaml" \
	   --docdir "/usr/share/doc/$pkgname"

    install -d $pkgdir/usr/share/licenses/$pkgname/
    mv $pkgdir/usr/share/doc/$pkgname/$_ocamlname/LICENSE $pkgdir/usr/share/licenses/$pkgname/
}
