# Maintainer: Zhiwei Chen <condy0919@gmail.com>
# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

pkgname=merlin
pkgver=5.9
pkgrel=1
pkgdesc="Context sensitive completion for OCaml in Vim and Emacs"
arch=('x86_64')
depends=('glibc' 'ocaml' 'ocaml-csexp' 'ocaml-merlin-lib' 'python' 'zstd')
makedepends=(
	'dune'
#	'ocaml-alcotest'
)
checkdepends=('jq' 'ocaml-menhir')
url="https://ocaml.github.io/merlin"
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ocaml/merlin/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('cd7d2e67c7190695d403af057d6d98927d11155db89cad62dc61d97c2f5831c010841ef7aab506946363908aab0e9f88f441653e34b40dc70e622111a2db3051')
options=('!strip')

build() {
    cd $srcdir/merlin-$pkgver
    dune build -p merlin
}

# check() {
#     cd $srcdir/merlin-$pkgver
#     dune test --release --verbose
# }

package() {
    cd $srcdir/merlin-$pkgver

    DESTDIR="${pkgdir}" dune install -p merlin \
	   --prefix "/usr" \
	   --libdir "/usr/lib/ocaml" \
	   --docdir "/usr/share/doc/$pkgname"

    install -d $pkgdir/usr/share/licenses/$pkgname/
#    mv $pkgdir/usr/share/doc/$pkgname/$pkgname/LICENSE $pkgdir/usr/share/licenses/$pkgname/
}
