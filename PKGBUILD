# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

pkgname=ocaml-toml
pkgver=7.1.0
pkgrel=2
pkgdesc="OCaml library providing a parser, a serializer and a printer for TOML"
arch=('x86_64')
url="https://ocaml-toml.github.io/To.ml"
license=('LGPL-3.0-only')
depends=('glibc' 'ocaml' 'ocaml-iso8601')
makedepends=('dune' 'git' 'ocaml' 'ocaml-menhir')
checkdepends=('ocaml-ounit' 'ocaml-mdx')
_tag=de076187d137b792f4435baf1ad533f6b2029e76 # git rev-parse "${pkgver}"
source=("$pkgname-$pkgver::git+https://github.com/ocaml-toml/To.ml.git#tag=$_tag?signed")
validpgpkeys=('539B50E2211221DB29D8F7CD8981C3C62D1D28F1') # Léo Andrès (zapashcanon) <leo <at> ndrs <dot> fr>
b2sums=('SKIP')
options=('!debug') # Prevent creating empty directories in /usr/src/

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    dune build --release --verbose
}

check() {
    dune runtest --release --verbose
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    DESTDIR="${pkgdir}" dune install \
	   --release \
	   --prefix "/usr" \
	   --libdir "/usr/lib/ocaml" \
	   --docdir "/usr/share/doc/$pkgname"
}
