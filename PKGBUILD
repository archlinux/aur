# Maintainer: JakobDev <jakobdev@gmx.de>

pkgname=illuaminate
pkgver=latest
pkgrel=1
pkgdesc='Very WIP static analysis for Lua '
arch=(any)
url='https://squiddev.cc/illuaminate'
license=(BSD 3-Clause)
makedepends=('git' 'opam' 'upx')
provides=(illuaminate)
source=("git+https://github.com/SquidDev/illuaminate.git")
sha256sums=('SKIP')

prepare() {
    cd illuaminate
    opam init -a
    eval $(opam env)
    if [ ! -d "$HOME/.opam/4.08.1" ]; then
        opam switch create 4.08.1
    else
        opam switch set 4.08.1
    fi
    eval $(opam env)
    opam pin add -y omnomnom https://github.com/SquidDev/omnomnom.git
    opam pin add -y lsp https://github.com/SquidDev/ocaml-lsp-subtree.git
    opam install -y --deps-only ./illuaminate.opam
}

build() {
    dune build @install
}

package() {
    install -Dm755 _build/install/default/bin/illuaminate "${pkgdir}/usr/bin/illuaminate"
    install -Dm755 _build/install/default/bin/illuaminate-lsp "${pkgdir}/usr/bin/illuaminate-lsp"
}
