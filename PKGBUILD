# Maintainer: Antonio Davide Trogu <contact at antoniodavide dot dev> 
# Previous Maintainer: Lucas Eduardo Wendt <lucas59356@gmail.com>

pkgname=sbcli-git
depends=("sbcl" "quicklisp")
optdepends=("python-pygments: Syntax Highlighting support")
pkgrel=2
pkgver=r89.11cfe35
arch=(any)
pkgdesc="A better REPL for SBCL"
license=("gpl3")
options=(!strip)
url="https://github.com/hellerve/sbcli"
source=("git+https://github.com/hellerve/sbcli" "quicklisp.patch")
sha256sums=('SKIP'
            '6b3064e234c149d936dd7eaa2ee0d4880294feeaa387506128c9bbc9a1499e85')

# if /usr/bin/env: “sbcl --script”: File or directory not found change hellerve to lucasew on source

pkgver() {
  cd "$srcdir/sbcli"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/sbcli"
  patch < ../quicklisp.patch
}

package() {
    mkdir -p $pkgdir/usr/bin
    cp "$srcdir/sbcli/repl.lisp" "$pkgdir/usr/bin/sbcli"
}
