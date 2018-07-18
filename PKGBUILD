# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=opam2
pkgver=2.0.0_rc3
pkgrel=1
pkgdesc="OCaml package manager"
arch=('x86_64')
url="https://opam.ocaml.org/"
license=('GPL')
depends=('ocaml' 'unzip' 'curl' 'bubblewrap')
optdepends=('darcs: For downloading packages with darcs'
            'git: For downloading packages with git'
            'mercurial: For downloading packages with mercurial'
            'rsync: For downloading packages with rsync')
makedepends=('ocaml-compiler-libs')
provides=('opam')
conflicts=('opam')
source=("https://github.com/ocaml/opam/releases/download/${pkgver//_/-}/opam-full-${pkgver//_/-}.tar.gz")
install=$pkgname.install
sha256sums=('d7ae1ce1be0c794dc557a50dee1b3844b2b646f9639279e02efb978471015e7c')

build() {
  cd "opam-full-${pkgver//_/-}"

  ./configure --prefix=/usr
  make -j1 lib-ext all
}

package() {
  make -C "opam-full-${pkgver//_/-}" DESTDIR="$pkgdir" install
}
