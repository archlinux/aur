# Maintainer: Matthieu Jolimaitre <matthieu@imagevo.fr>
pkgname=vscoq-language-server-git
pkgver=1.1.0
pkgrel=1
pkgdesc="VSCode coq / rocq language server."
arch=('x86_64')
url="https://github.com/rocq-prover/vsrocq"
license=('MIT')
depends=('gmp' 'zstd' 'glibc')
makedepends=('ocaml' 'dune' 'opam' 'git' 'rsync')
source=('git+https://github.com/rocq-prover/vsrocq.git')
sha256sums=('SKIP')
_ocaml_ver='5.1.0'

build() {
    cd "$srcdir"
    export OPAMROOT="$PWD/.opam"
    cd "$srcdir/vsrocq/language-server"
    if ! [ -d "$OPAMROOT" ]
    then  opam init --no-setup --compiler="$_ocaml_ver"
    fi
    eval "$(opam env)"
    opam install -j$(nproc) --yes .
}

package() {
    mkdir -p "$pkgdir/usr/bin"
    cp "$srcdir/.opam/$_ocaml_ver/bin/vsrocqtop" "$pkgdir/usr/bin/"
}
