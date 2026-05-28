# Maintainer: Platon Pronko < platon7pronko at gmail dot com >

pkgname=tree-sitter-heex-git
pkgver=0.9.0.r0.g5842537
pkgrel=1
pkgdesc="heex grammar for tree-sitter"
arch=("x86_64")
url="https://github.com/phoenixframework/tree-sitter-heex"
license=("MIT")
groups=("tree-sitter-grammars")
makedepends=("tree-sitter")
source=("$pkgname::git+$url")
sha256sums=("SKIP")

pkgver() {
    cd "$pkgname"
    ( set -o pipefail
      git describe --long --tags 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./' ||
          printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    cd "$pkgname"
    tree-sitter generate
}

build() {
    export PARSER_NAME=heex
    export PREFIX=/usr
    cd "$pkgname"
    make
}

package() {
    cd "$pkgname"
    DESTDIR="$pkgdir" make install
}
