# Maintainer: Matthieu Jolimaitre <matthieu@imagevo.fr>
pkgname=vscoq-language-server-git
pkgver=1.0.1
pkgrel=1
pkgdesc="VSCode coq language server."
arch=('i686' 'x86_64')
url="https://github.com/coq/vscoq"
license=('MIT')
depends=()
makedepends=('ocaml' 'dune')
source=('git+https://github.com/coq/vscoq.git')
sha256sums=('SKIP')
_ocaml_ver='5.1.0'
build() {
    cd "$srcdir"
    export OPAMROOT="$PWD/.opam"
    cd "$srcdir/vscoq/language-server"
    if ! [ -d "$OPAMROOT" ]
    then  opam init --no-setup --compiler="$_ocaml_ver"
    fi
    eval "$(opam env)"
    opam install -j$(nproc) --yes .
}
package() {
    mkdir -p "$pkgdir/usr/bin"
    cp "$srcdir/.opam/$_ocaml_ver/bin/vscoqtop" "$pkgdir/usr/bin/"
}
